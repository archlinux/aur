# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Asa Marco <marcoasa90[at]gmail[dot]com>
#
pkgname="imagination"
pkgver="3.0"
pkgrel="4"
pkgdesc="Imagination is a lightweight and simple DVD slideshow maker in GTK+2."
arch=('i686' 'x86_64')
url="http://imagination.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'ffmpeg' 'sox')
makedepends=('intltool' 'docbook-xsl')
provides=('imagination')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('417d8586d9c85109b87d30b9c196d63531a637cbc2ffb3c12b48a873bfcb4b1e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/PLUGINS_INSTALLED 0/PLUGINS_INSTALLED 1/g' src/support.h
    LDFLAGS="-lm -lgmodule-2.0" ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
