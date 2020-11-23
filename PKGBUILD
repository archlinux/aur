# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=mixbench-cuda-git
pkgver=0.193.v0.03.8.gbab3fb7
pkgrel=1
pkgdesc="GPU benchmark tool for evaluating GPUs on mixed operational intensity kernels (CUDA implementation)"
url="https://github.com/ekondis/mixbench"
license=('GPL2')
arch=('x86_64')
makedepends=('git' 'cmake')
depends=()
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

warn_build_references() {
  /bin/true
}

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -B build -S mixbench-cuda \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev

  make -C build
}

package() {
  cd "${srcdir}/${pkgname}/build"
  install -Dm755 "mixbench-cuda-ro" "${pkgdir}/usr/bin/mixbench-cuda"
}
