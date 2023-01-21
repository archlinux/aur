# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.10.0
pkgrel=1
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm-4.0' 'nautilus' 'desktop-file-utils')
makedepends=('meson')
options=('!libtool')
source=(https://rofi.roger-ferrer.org/${pkgname}/files/${pkgname}-${pkgver}.tar.xz)
sha512sums=('964ca9656a734e730ff28a1b236820e7f6c4a08bc996be56dba0321448aadd5229b47c0495bf995a46535fdd024c84257e8e834baaeec07464ac903ed3473d97')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	arch-meson . build
	meson compile -C build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson test -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson install -C build --destdir "$pkgdir"
}
