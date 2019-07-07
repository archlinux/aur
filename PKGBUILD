# Maintainer: Darren Ldl <darrenldldev@gmail.com>
pkgname=blkar
pkgver=7.2.2
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
sha256sums=('afa14d1644e3aa959cba038ab9e1768682904d35b7b0490d1826e3af7f469ca7')

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
