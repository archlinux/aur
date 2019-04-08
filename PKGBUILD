# Maintainer: Darren Ldl <darrenldldev@gmail.com>
pkgname=blkar
pkgver=4.0.0
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
sha256sums=('4a63ea09aad24cdf5983fd65c31c1b400b6dc6df0f171d6e6b8b2df645e7d4e7')

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