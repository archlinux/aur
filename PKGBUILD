# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vomit
pkgver=0.5.1
pkgrel=1
pkgdesc="The Very Opinionated Mail Interaction Toolkit"
arch=('x86_64')
url="https://sr.ht/~bitfehler/vomit"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('477f0ff3ab3bb72cbb7c16ab4d3f2b4d417524184eb3f2c55c1e2e8e3d582c06816bf62a472d2a607dea3b7c7b0e6176f3ebd3906c428dc1ffcac32e10816e4a')

build() {
  cd "$pkgname-v$pkgver"

  cargo build --release --locked -p vmt
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 "target/release/vmt" "$pkgdir/usr/bin/vmt"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
