# Maintainer: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
# Contributor: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
pkgname=mfaomp
pkgver=0.4.0
pkgrel=1
pkgdesc="Multiple Files At Once Media Player"
arch=('x86_64')
url="https://github.com/Neurofibromin/mfaomp"
license=('GPL-3.0-or-later')
depends=(
  'libvlc'
)
makedepends=(
  'cmake'
  'pkgconf'
  'qt6-webengine'
  'qt6-base'
  'qt6-multimedia'
)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d475aaa39153ffc24f56d0c99d31df8d4e40c53b8a41b9c568704d86d04a05dee5842d189924a1ea2a95baf0f6732e9879660827d3d60645029f5a6e1ce413f5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=23 \
    -DCMAKE_CXX_STANDARD_REQUIRED=ON
  cmake --build build
}

package() {
  cmake --install build --prefix "$pkgdir/usr"
  # TODO: cmake doesn't do this, but maybe it should?
  install -Dm644 "$srcdir/$pkgname-$pkgver/mfaomp.desktop" "$pkgdir/usr/share/applications/mfaomp.desktop"
}
