# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=drill
pkgver=0.7.2
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
url="https://github.com/fcsonline/drill"
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cc33f5e214cf8c9c975bd2b912b87541eab2ceb34689fdc1f4882b332ad4ee44')

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
