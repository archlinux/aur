# Maintainer: Darren Ldl <darrenldldev@gmail.com>
pkgname=blkar
pkgver=7.2.5
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
sha256sums=('c53e513c74ed6365ec2dd4e58d807ad76cfc1ddbffa45aa9a9c201e48698090a')

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
