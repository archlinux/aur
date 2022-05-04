# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vomit
pkgver=0.2.0
pkgrel=1
pkgdesc="The Very Opinionated Mail Interaction Toolkit"
arch=('x86_64')
url="https://sr.ht/~bitfehler/vomit"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f1367ed778cb40b50edfa0360b8eee83f32ced00d224bfe86ea23001a9a1077189757f0dd992d2023e0d05cf8fc7542b6e7cc6a18cabbeec45af6145d92caeb7')

build() {
  cd "$pkgname-v$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-v$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 "target/release/vmt" "$pkgdir/usr/bin/vmt"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
