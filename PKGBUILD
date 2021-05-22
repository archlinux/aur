# Maintainer: Guillaume ALAUX <Guillaume at ALAUX dot net>
pkgname=quackle
pkgver=1.0.4
pkgrel=1
pkgdesc='Free crossword game (Scrabble-like) artificial intelligence and analysis tool'
arch=('i686' 'x86_64')
url='http://people.csail.mit.edu/jasonkb/quackle'
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-base')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz
        Quackle.in)
sha256sums=('f938c3c0e8ef7ef95cc0505bb1425bf90d783275f365d3aaef19586da70a46b6'
            'fabaf321b3ec645ba9561c00202d1a31577b4086014ddb609c06905a6152035a')

build() {
  for dir in "" quackleio quacker; do
    cd "${srcdir}/${pkgname}-${pkgver}/${dir}"
    qmake-qt5
    make clean
    make
  done
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 ${pkgdir}/usr/share/${pkgname}
  cp -r quacker/Quackle data ${pkgdir}/usr/share/${pkgname}
  install -Dm755 ${srcdir}/Quackle.in ${pkgdir}/usr/bin/Quackle
}
