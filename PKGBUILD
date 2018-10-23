# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Asa Marco <marcoasa90[at]gmail[dot]com>
#
pkgname="imagination"
pkgver="3.1"
pkgrel="1"
pkgdesc="Imagination is a lightweight and simple DVD slideshow maker in GTK+2."
arch=('i686' 'x86_64')
url="http://imagination.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'ffmpeg' 'sox')
makedepends=('intltool' 'docbook-xsl')
provides=('imagination')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('96f53656eae043e061e35fa09e81386c04a9edef9fff75f047f880553e1777a8')

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

# vim:set ts=4 sw=4 ft=sh et:
