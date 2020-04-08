pkgname=retdec
pkgver=4.0
pkgrel=1
arch=('x86_64')
pkgdesc="A retargetable machine-code decompiler based on LLVM."
url="https://retdec.com/"
license=('MIT')
depends=('graphviz' 'bc' 'upx' 'wget' 'python')
makedepends=('perl' 'cmake')
provides=('retdec')
conflicts=('retdec')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/avast-tl/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b26c2f71556dc4919714899eccdf82d2fefa5e0b3bc0125af664ec60ddc87023')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
}
