# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=drill
pkgver=0.9.0
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
url="https://github.com/fcsonline/drill"
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ac486698c33daecb2d099fbb890d0b37ffd9baf3655d620f57932e1d398b44fc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 example/*.yml -t "$pkgdir/usr/share/drill/example/"
  cd target/release
  install -Dm755 drill "$pkgdir/usr/bin/drill-rs"
}
