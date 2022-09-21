# Original Maintainer: Nero AG <techsupport@nero.com>
# Maintainer: BethHarmon <BethOliviaHarmon at gmail dot com>
# Created from https://aur.archlinux.org/packages/nerolinux3
# Edited by visious

pkgname=nerolinux4
pkgver=4.0.0.0b
pkgrel=3
pkgdesc="Nero Burning ROM for linux"
arch=('x86_64')
url="http://nerolinux.nero.com"
license=('Nero AG')
depends=(
	'atk'
	'cairo'
	'desktop-file-utils'
	'fontconfig'
	'gcc-libs>=4.1.1'
	'gdk-pixbuf2'
	'glib2>=2.12.0'
	'glibc>=2.3.6'
	'gtk2>=2.8.0'
	'hicolor-icon-theme'
	'libx11'
	'libxcursor'
	'libxext'
	'libxfixes'
	'libxi'
	'libxinerama'
	'libxrandr'
	'libxrender'
	'pango'
)
source=("nerolinux-${pkgver}-x86_64.rpm"::'http://nero-mirror.com/support/NeroLINUX/nerolinux-4.0.0.0b-x86_64.rpm')
md5sums=('f5b307c37e5623231e0a042ee43e018c')

prepare() {
	cd "$srcdir"
	chmod a+rx -R *
	find . -type f -exec chmod -x \{\} \;
	chmod +x usr/bin/{nero,nerocmd,neroexpress}
	
	# Remove shortcut nerolinux-4.0.0.0b-x86_64.rpm
	rm -r "${srcdir}/nerolinux-4.0.0.0b-x86_64.rpm"

	# Fixing device problems
	# Load module "sg" for Nerolinux.
    mkdir -p "${srcdir}/etc/modules-load.d/"
	touch "${srcdir}/etc/modules-load.d/${pkgname}.conf"
	echo sg > "${srcdir}/etc/modules-load.d/${pkgname}.conf"
}

package() {
	cd "$pkgdir"
	mv "${srcdir}"/* .
	mkdir -p usr/share/licenses/nerolinux
	mv usr/share/doc/nero/EULA* usr/share/licenses/nerolinux
	mv usr/lib64/ usr/lib/
}
