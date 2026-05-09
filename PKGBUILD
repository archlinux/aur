# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=1.1.2
pkgrel=1
pkgdesc="A TUI client for Discord"
arch=(x86_64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0)
depends=(glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=('!lto')
sha256sums=('923a4e0d5f7337dae6330110c63867200b1ae4f636ea5724d2981326531fd162')

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
