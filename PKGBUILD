# Maintainer: gbr <gbr@protonmail.com>
pkgname=sfz
pkgver=0.6.1
pkgrel=1
pkgdesc='A simple static file server'
arch=('x86_64')
url='https://github.com/weihanglo/sfz'
license=('MIT' 'APACHE')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d2c6d5295d1c81a59106a66f41ec9cc6a0f0ef25396e1eb09aad01faeb8b5b2782fbf1025c4e45b14b4e7ee6a5eb92cb68ac35194c5f0eed0d591282f11182d7')

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

