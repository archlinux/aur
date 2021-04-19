# Maintainer: gbr <gbr@protonmail.com>
pkgname=sfz
pkgver=0.5.0
pkgrel=1
pkgdesc='A simple static file server'
arch=('x86_64')
url='https://github.com/weihanglo/sfz'
license=('MIT' 'APACHE')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3f84cea23f3a44ec4002b11fa104e77ffbd48b91e98b0a9ed4d4923b4d35ecc95c17fa3873ff59606d682e63f5b76b26608f7a78e487144dddc661a7e8a4784c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'LICENSE-APACHE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 'LICENSE-MIT' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

