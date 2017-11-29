# Maintainer: Andrew Anderson <aanderso@tcd.ie>

pkgname=mkl-dnn
pkgver=0.10
pkgrel=4

epoch=
pkgdesc="Intel® Math Kernel Library for Deep Neural Networks"
arch=( 'x86_64' )
url="https://github.com/01org/mkl-dnn"
license=('APACHE')
groups=()
depends=()
makedepends=( 'git' 'cmake>=2.8' 'doxygen>=1.8.5' )
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/01org/mkl-dnn.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/mkl-dnn"
  git checkout v0.10
  ([[ ! -d external ]] && (cd scripts && ./prepare_mkl.sh && cd -)) || true
  mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr .. && make doc && make -j2 mkldnn
}

#check() {}

package() {
  cd "${srcdir}/mkl-dnn/build"
  make install
  mkdir -p ${pkgdir}/usr/include/mkldnn/include/
  cp -r ../external/mkl*/include/* ${pkgdir}/usr/include/mkldnn/include/
  mkdir -p ${pkgdir}/usr/lib/mkldnn/lib/
  cp -r ../external/mkl*/lib/* ${pkgdir}/usr/lib/mkldnn/lib/
}
