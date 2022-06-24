# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.4.0
pkgrel=2
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('76eedffea3ca3f623cecb6cecdf7df657a6d95e589b26729ac9d8728adbd0296310749f1a83d4592801dacb7870683c166895a5541b4c565c6dfc8d63de2f113')

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
