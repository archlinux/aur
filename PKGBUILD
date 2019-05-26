# Maintainer: Darren Ldl <darrenldldev@gmail.com>
pkgname=blkar
pkgver=7.0.0
pkgrel=1
epoch=
pkgdesc="Archive with forward error correction and sector level recoverability"
arch=('x86_64')
url="https://github.com/darrenldl/blockyarchive"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("https://github.com/darrenldl/blockyarchive/archive/v${pkgver}.tar.gz")
sha256sums=('e0cf121ec230958db145ef4211730d1162f60934b1bbb86b97221ae026618fbf')

build() {
  cd "blockyarchive-$pkgver"
  cargo build --release --locked
}

check() {
  cd "blockyarchive-$pkgver"
  cargo test --release --locked
}

package() {
  cd "blockyarchive-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
