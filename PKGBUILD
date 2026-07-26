# Maintainer: neolax <NEOLAX@proton.me>
pkgname=anihub-cli
pkgver=0.8.0
pkgrel=1
pkgdesc='Unofficial terminal client for browsing and watching anime from AniHub'
arch=('x86_64' 'aarch64')
url='https://github.com/NEO-LAX/anihub-cli'
license=('MIT')
depends=('gcc-libs' 'mpv')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ca717dd4ce0fa4b5bc5198631cd57c232779c2a7f5b0d86e9717051a9e1b9e6')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

