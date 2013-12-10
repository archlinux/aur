# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom
pkgver=2.0.0
pkgrel=1
pkgdesc="Doom, Heretic, Hexen, Strife port accurately reproducing the originals."
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
depends=('sdl' 'sdl_mixer' 'sdl_net')
makedepends=('autoconf' 'python')
install=${pkgname}.install
source=(http://${pkgname}.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('85c58b77dad933013253b453ef01907492b4719acd56cf8cb6c76f4a361ab60c')

build() {
  cd "${pkgname}-${pkgver}"

  # Change binary dir from /usr/games to /usr/bin
  sed 's|/games|/bin|g' -i src{,/setup}/Makefile.am

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
