# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vmt
pkgver=0.8.0
pkgrel=1
pkgdesc="The Very Opinionated Mail Interaction Toolkit (vomit) - CLI tool"
arch=('x86_64')
url="https://sr.ht/~bitfehler/vomit"
license=('GPL3')
replaces=('vomit')
depends=('gcc-libs' 'openssl' 'glibc')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f48e465c6c60e5c3959a04f900b22d856e1ac0aa6be1c7afcf412ed2c92ebe83e4e7590a8c374cdaa985f6fb5cf9094d9b86ab975e218350f4901dadea6d30e5')

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
