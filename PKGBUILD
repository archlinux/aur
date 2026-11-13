# Maintainer: zhiyuHD <zhiyuxl@outlook.com>

pkgname=yubild
pkgver=0.1.0
pkgrel=1
pkgdesc="C++ build system with Python configuration and a CMake backend"
arch=('x86_64' 'aarch64')
url="https://github.com/zhiyuHD/yubild"
license=('MIT')
depends=('cmake' 'python')
makedepends=('cargo')
optdepends=('gcc: 编译 C/C++ 项目'
            'clang: 替代编译器')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('24427ecead826522c9b578e407ea589a1f4d6d49e81dd7c966a1c72399909023')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
