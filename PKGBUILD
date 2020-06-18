# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tundra2
pkgver=2.14
pkgrel=1
pkgdesc="A code build system that tries to be accurate and fast for incremental builds"
arch=('x86_64')
url='https://github.com/deplinenoise/tundra'
license=('MIT')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deplinenoise/tundra/archive/v${pkgver}.tar.gz")
sha256sums=('db3d4b13820373a038a08b8751376e3ecdf49355f329a7909cd2f836372dffe1')

prepare() {
  cd "${pkgname%2}-${pkgver}/unittest"
  rm -rf googletest
  git clone https://github.com/google/googletest
  cd googletest
  git reset --hard 5490beb0602eab560fa3969a4410e11d94bf12af
}

build() {
  cd "${pkgname%2}-${pkgver}"
  make
}

package() {
  cd "${pkgname%2}-${pkgver}"
  make PREFIX="${pkgdir}"/usr install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}