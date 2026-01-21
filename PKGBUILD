# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.1.4
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
pkgver=9.1.4
pkgrel=2
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'git')
depends=('zstd' 'openssl')
provides=('lemonade-server')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
'39693579ff993d7ed9dcb8fbc41d74556822452b73aeba57d27f350014951022'
)

build() {
  local cmake_options=(
    -B build
    -S lemonade-$pkgver/src/cpp
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rfv "$pkgdir/usr/include/"
  rm -rfv "$pkgdir/usr/lib"
}
