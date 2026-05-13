# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=1.3.2
pkgrel=1
pkgdesc="A feature rich terminal client for Discord"
arch=(x86_64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0)
depends=(glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('45b3b0edf4ec5390acbf803a69aa79e25d46557bff0dbed5d058453e669097bf')
options=('!lto')

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver

  cargo build --frozen --release
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
