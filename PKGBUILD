# Maintainer: gbr <gbr@protonmail.com>
pkgname=sfz
pkgver=0.6.2
pkgrel=1
pkgdesc='A simple static file server'
arch=('x86_64')
url='https://github.com/weihanglo/sfz'
license=('MIT' 'APACHE')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('eb574b709b3ec92585c675e7078e035df0ea88ad6b65b560c941c728ae106f4c95ac22545f77137a0acfc036a7252bbc786b41753ab51ad84272210ed3ab6a2f')

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

