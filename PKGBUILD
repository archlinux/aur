# Maintainer: Szymon Scholz < szymonscholz at gmail dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=gpicview-gimp
_pkgname=gpicview
pkgver=0.2.5
pkgrel=1
pkgdesc='Lightweight image viewer (with GIMP launcher)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde')
depends=('gtk2' 'desktop-file-utils' 'xdg-utils')
install=$_pkgname.install
makedepends=('pkgconfig' 'intltool')
optdepends=('librsvg: For SVG support')
source=("http://downloads.sourceforge.net/sourceforge/lxde/$_pkgname-$pkgver.tar.xz"
        "gimp.patch")

prepare() {
	cd $_pkgname-$pkgver

	# Apply only one main category (FS#34684)
	sed -i '/^Categories=/ s/Utility;//' gpicview.desktop.in

        # Add "Edit with GIMP" popup menu item
        patch src/main-win.c ../gimp.patch
}

build() {
	cd $_pkgname-$pkgver
	./configure --sysconfdir=/etc --prefix=/usr
	make
}

package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
md5sums=('26be9b0c5a234f1afe7d83d02a4a33f4'
         '9bdaf66572db2cf5d9d9d0be1cc0769d')
