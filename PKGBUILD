# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vmt
pkgver=0.6.0
pkgrel=1
pkgdesc="The Very Opinionated Mail Interaction Toolkit - CLI tool"
arch=('x86_64')
url="https://sr.ht/~bitfehler/vomit"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('33ce96e31768dc164f25430db3695fa8f39db85fa16d9dbf1cc330ae501f6a3d36ea1039f13b99c3ec0044401ad4d7c148918e0c8934b1c1ba83d28ed44c7085')

build() {
  cd "$pkgname-v$pkgver"

  cargo build --release --locked
  make -C man man
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 "target/release/vmt" "$pkgdir/usr/bin/vmt"
  install -Dm644 man/*.1.gz -t "$pkgdir/usr/share/man/man1/"  
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
