# Maintainer: israrkhan-cys 7israr.work@gmail.com
pkgname=radiq
pkgver=0.1.1
pkgrel=1
pkgdesc="A weapon-select-wheel-style radial application launcher for Hyprland"
arch=('x86_64')
url="https://github.com/israrkhan-cys/radiq"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'layer-shell-qt' 'hyprland')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/israrkhan-cys/radiq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1cf2832ccd917604ca5c443c8aee65c0be63cc0754ecdd69f5a5b599fc2181a7')

build() {
  cd "$pkgname-$pkgver"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/src/radiqd "$pkgdir/usr/bin/radiqd"
  install -Dm755 build/tools/radiqctl/radiqctl "$pkgdir/usr/bin/radiqctl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
