# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=drill
pkgver=0.5.0
pkgrel=1
pkgdesc="Drill is a HTTP load testing application written in Rust inspired by Ansible syntax"
url="https://github.com/fcsonline/drill"
depends=('openssl')
makedepends=('cargo' 'pkgconf')
arch=('x86_64')
license=('GPL-3.0')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('ecafaa5eae61617cae8c08bb8358b338')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 example/*.yml -t "$pkgdir/usr/share/drill/example/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd target/release
  install -Dm755 drill "$pkgdir/usr/bin/drill-rs"
}