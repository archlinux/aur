# maintainer: libele <libele@disroot.org>

# contributor: John Robinson <jbr100uk@googlemail>
# contributor: Rene Wiermer <rwiermer@googlemail>
# contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=frobtads
pkgver=2.0
pkgrel=2
pkgdesc="Combined TADS 2 & 3 interpreter and compilers for playing and creating Interactive Fiction games"
arch=('i686' 'x86_64')
url="http://www.tads.org/frobtads.htm"
license=('custom: freeware')
depends=('ncurses' 'curl')
makedepends=('cmake' 'git')
source=("https://github.com/realnc/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('5188944620298695508b9b41a2dba49c')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd build
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd build
  make DESTDIR="${pkgdir}" install

  cd ..
  install -Dm644 tads3/LICENSE.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
