# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=xi-core
pkgver=0.3.0
pkgrel=2
pkgdesc='A modern editor with a backend written in Rust'
arch=(i686 x86_64 armv7h aarch64)
url='https://github.com/xi-editor/xi-editor'
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e42998ad9b6d6df0f797afd005f9c1286aad24c30a77d0dd380730c248274b8d')


prepare() {
  cd "xi-editor-$pkgver/rust"
  cargo fetch --locked
}

build() {
  cd "xi-editor-$pkgver/rust"
  cargo build --locked --release --offline --all-features
}

check() {
  cd "xi-editor-$pkgver/rust"
  cargo test --locked --release --offline
}

package() {
  cd "xi-editor-$pkgver/rust"
  install -D "target/release/xi-core" -t "$pkgdir/usr/bin"
}
