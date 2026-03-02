# Maintainer: Jan Dorazil <deu439@gmail.com>

pkgname=wavelib-git
pkgver=r131.7f61bf5
pkgrel=1
pkgdesc="C Implementation of Discrete Wavelet Transform (DWT,SWT and MODWT), Continuous Wavelet transform (CWT) and Discrete Packet Transform ( Full Tree Decomposition and Best Basis DWPT)."
arch=('any')
license=('BSD 3-Clause')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/rafat/wavelib.git")
sha256sums=('SKIP')
url="https://github.com/rafat/wavelib/tree/master"
options+=('!debug' '!lto')
provides=("${pkgname%-git}")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
       cd "$pkgname"
       DESTDIR="$pkgdir" cmake --install build
}
