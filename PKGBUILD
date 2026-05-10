# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=1.3.0
pkgrel=1
pkgdesc="A feature rich terminal client for Discord"
arch=(x86_64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0)
depends=(glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=('!lto')
sha256sums=('41645656a96b23f55a7b16d2a94e301d7dfaab907d2fc38115ea3861d535c1fb')

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
