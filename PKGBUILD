# Maintainer: David Peter <mail@david-peter.de>
pkgname=dbg-macro
pkgver=0.4.0
pkgrel=1
pkgdesc="A C++ macro for printf-style debugging fans."
arch=(any)
url="https://github.com/sharkdp/dbg-macro"
license=('MIT')
depends=()
optdepends=()
makedepends=('git' 'cmake')
source=("git+https://github.com/sharkdp/dbg-macro/#tag=v${pkgver}"
        "git+https://github.com/catchorg/Catch2#tag=v2.11.1")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "${pkgname}"

  git submodule init
  git config submodule."tests/Catch2".url "$srcdir"/Catch2
  git submodule update
}

build() {
  cd "${pkgname}"

  git submodule init

  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDBG_MACRO_ENABLE_TESTS=1
  make
}

check() {
  cd "${pkgname}/build"
  make test
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
