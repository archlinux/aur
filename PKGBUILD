# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rumdl
pkgver=0.0.194
pkgrel=1
pkgdesc='Markdown Linter and Formatter written in Rust'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/rvben/rumdl
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('29071c7fa3e7eaa295cb14f8577884d2f11724b5b59d614fbcc22185738ae036')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin rumdl
}

#check() {
#  cd $pkgname-$pkgver
#  export RUSTUP_TOOLCHAIN=stable
#  cargo test --frozen
#}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
