# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="libbbf"
pkgname="$_pkgname"
pkgver=3.0.1
pkgrel=1
pkgdesc="Bound Book Format: A high-performance, DirectStorage-native container format for comics and manga"
url="https://github.com/ef1500/libbbf"
license=('MIT')
arch=('any')
depends=(
  xxhash
)
makedepends=(
  cmake
  ninja
)
optdepends=('catch2: bbfbench')
provides=("$_pkgname=$pkgver")
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('18f25d199a6a372a2b894f00d6578d41ceadd022ffd2a773c18377d9fb441c02')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  local _cmake_options=(
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
