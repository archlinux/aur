# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>

pkgname=tmux-mem-cpu-load
pkgver=3.8.3
pkgrel=2
pkgdesc='CPU, RAM, and load monitor for use with tmux'
arch=(x86_64 aarch64)
url='https://github.com/thewtex/tmux-mem-cpu-load'
license=(Apache-2.0)
depends=(libstdc++.so=6-64)
makedepends=(cmake)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('61cffc7938ac690a9fb78eac36125b036456d5020cee3faef9851bbad03f62f6f1abb69d3c704e7badbee4df6b00d8abd548966840ec8c49a9faf48675f9418a')

build() {
  local cmake_options=(
    -B build
    -S "${pkgname}-${pkgver}"
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
