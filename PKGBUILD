# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=databow
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line tool for querying databases"
arch=('x86_64')
url="https://github.com/columnar-tech/databow"
license=('Apache-2.0')
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('09e64f773c3f5399a8a645608b550e0d0679d693f1888901da9c508bcdef95dd')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
