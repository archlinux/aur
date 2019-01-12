# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Asa Marco <marcoasa90[at]gmail[dot]com>
#
pkgname="imagination"
pkgver="3.4"
pkgrel="1"
pkgdesc="Imagination is a lightweight and simple DVD slideshow maker in GTK+2."
arch=('i686' 'x86_64')
url="http://imagination.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'ffmpeg' 'sox')
makedepends=('intltool' 'docbook-xsl')
provides=('imagination')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('1c7cceb54a2316586c39149364110fb1a15f0a580be130847e78a256529d55e4')

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
