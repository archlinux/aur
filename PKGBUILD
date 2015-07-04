# Maintainer: Guillaume ALAUX <Guillaume at ALAUX dot net>
pkgname=quackle
pkgver=0.98
pkgrel=1
pkgdesc='Free crossword game (Scrabble-like) artificial intelligence and analysis tool'
arch=('i686' 'x86_64')
url='http://people.csail.mit.edu/jasonkb/quackle'
license=('GPL')
depends=('qt4')
makedepends=('qt4')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz
        Quackle.in)
sha256sums=('2ad9b782054a9a466c7a56049003d721c952870abf87490bda7f1e66f8a4e353'
            'fabaf321b3ec645ba9561c00202d1a31577b4086014ddb609c06905a6152035a')

build() {
  for dir in "" quackleio quacker; do
    cd "${srcdir}/${pkgname}-${pkgver}/${dir}"
    qmake-qt4
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
