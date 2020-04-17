pkgname=retdec-git
pkgver=20200417_bc01f3b0
pkgrel=1
arch=('x86' 'x86_64')
pkgdesc="RetDec is a retargetable machine-code decompiler based on LLVM."
url="https://retdec.com/"
license=('MIT')
depends=('graphviz' 'bc' 'upx' 'wget' 'python')
makedepends=('git' 'perl' 'cmake' 'flex' 'bison')
provides=('retdec')
conflicts=('retdec')

source=("${pkgname}::git+https://github.com/avast/retdec.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --date=format:%Y%m%d --pretty=format:%ad_%h
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make install
}
