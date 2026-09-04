# Maintainer: neolax <NEOLAX@proton.me>
pkgname=anihub-cli
pkgver=0.10.0
pkgrel=1
pkgdesc='Unofficial terminal client for browsing and watching anime from AniHub'
arch=('x86_64' 'aarch64')
url='https://github.com/NEO-LAX/anihub-cli'
license=('MIT')
depends=('gcc-libs' 'mpv')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d38babb6cebdca836f188fa09d51e7877966944427bee9b00fb4dda7c31bdba2')

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
