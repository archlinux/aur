# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.2.1
pkgrel=1
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('ac7afa41d89d47dd5fccb25938835ab230cd54ed65dee7eb60568faadd482b05918b0dd353175f349af9933c4f627380f45b7c7e9b9f3b24172a9ecdf1c428c9')

build() {
  cd "vomit-sync-v$pkgver"

  cargo build --release --locked -p vsync
}

package() {
  cd "vomit-sync-v$pkgver"

  install -Dm755 "target/release/vsync" "$pkgdir/usr/bin/vsync"

  install -Dm644 "cli/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
