# Maintainer: Darren Ldl <darrenldldev@gmail.com>
pkgname=blkar
pkgver=7.2.3
pkgrel=1
epoch=
pkgdesc="Multithreaded archiver offering bit rot protection and sector level recoverability"
arch=('x86_64')
url="https://github.com/darrenldl/blockyarchive"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("https://github.com/darrenldl/blockyarchive/archive/v${pkgver}.tar.gz")
sha256sums=('9683c00a76fff3e2d2607b9f543771cbd9cce06f0dc8f63a6e705a276fcc4e5b')

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
