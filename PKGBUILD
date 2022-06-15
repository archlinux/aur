# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vomit
pkgver=0.3.1
pkgrel=1
pkgdesc="The Very Opinionated Mail Interaction Toolkit"
arch=('x86_64')
url="https://sr.ht/~bitfehler/vomit"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('edca1a436941df2aa9eef3f9724ea96b911dce7a54c0256423b54950579ea30b00722c0a5c3f78f8ee3502779210a8e36ef628d0abd9f8ec743ed29707bc36ef')

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
