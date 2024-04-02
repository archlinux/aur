# Maintainer: Laythe <laythedev@gmail.com>
pkgname=blkar
pkgver=7.2.7
pkgrel=2
epoch=
pkgdesc="Multithreaded archiver offering bit rot protection and sector level recoverability"
arch=('x86_64')
url="https://github.com/darrenldl/blockyarchive"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("https://github.com/darrenldl/blockyarchive/archive/v${pkgver}.tar.gz")
sha256sums=('807d4ad9fca8afe13bbd7020ecf9102298d59d839b1a8fccd8693799a8edfc9b')

build() {
  cd "blockyarchive-$pkgver"
  cargo update -p lexical-core
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
