# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vomit
pkgver=0.4.0
pkgrel=1
pkgdesc="The Very Opinionated Mail Interaction Toolkit"
arch=('x86_64')
url="https://sr.ht/~bitfehler/vomit"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6ec9f40564beb70743de580ce8d8a59c0f4e73fd018c05e143a4d1590004815dea6088ece17ec5925227008113c7cedb8f5d9ac05672ce6618cfa9dc3849a7a5')

build() {
  cd "$pkgname-v$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 "target/release/vmt" "$pkgdir/usr/bin/vmt"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
