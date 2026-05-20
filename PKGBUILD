# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.0.4
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord, written in Rust"
arch=(x86_64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(libgcc alsa-lib opus)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a95ae58a9d5c53b2c1f0dd62636d6f30f71af061cfa9937eb192419679ddd9c')
options=('!lto')

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver

  cargo build --frozen --release --features voice-playback
}

check() {
  cd $pkgname-$pkgver
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver

  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
