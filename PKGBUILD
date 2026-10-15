# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=databow
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line tool for querying databases"
arch=('x86_64')
url="https://github.com/columnar-tech/databow"
license=('Apache-2.0')
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3794948bf83a284e5cad7038ba0205a3fa81053ec47ce6dcc18a2ac97e4be918')

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
