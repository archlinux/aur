# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
pkgname=fastpwd
pkgver=0.0.1
pkgrel=3
pkgdesc="Hash-based (SHA-3) Qt password generator and manager"
url="https://github.com/pfactum/fastpwd/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=(
	'bzip2'
	'freetype2'
	'gcc-libs-multilib'
	'glib2'
	'glibc'
	'graphite'
	'harfbuzz'
	'icu'
	'libdrm'
	'libffi'
	'libgcrypt'
	'libgpg-error'
	'libpng'
	'libsystemd'
	'libx11'
	'libxau'
	'libxcb'
	'libxdamage'
	'libxdmcp'
	'libxext'
	'libxfixes'
	'libxshmfence'
	'libxxf86vm'
	'mesa'
	'mesa-libgl'
	'pcre'
	'qt5-base'
	'xz'
	'zlib')
makedepends=('clang' 'qtchooser' 'git' 'gtk-update-icon-cache')
source=(${pkgname}::git+https://github.com/pfactum/fastpwd.git)

install='fastpwd.install'

md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	qmake
	# Detect CPUs count automatically
	CPUS_COUNT=`cat /proc/cpuinfo | grep processor | wc -l`
	echo "Compiling using $CPUS_COUNT thread(s)"
	make -j$CPUS_COUNT
}

package() {
	cd ${srcdir}/${pkgname}
	INSTALL_ROOT=${pkgdir}/ make install
	install -m 644 -D fastpwd.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/fastpwd.png"
	install -m 644 -D fastpwd.desktop "$pkgdir/usr/share/applications/fastpwd.desktop"
}

