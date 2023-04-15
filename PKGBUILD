# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=drill
pkgver=0.8.3
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
url="https://github.com/fcsonline/drill"
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('12096bfeb57fa567f9104615c872b5fec787bacf5b9efcc9f14d496c08efe30d')

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
