# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.6.2
pkgrel=1
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('99154efee31b9d605966bc0e02c610d1aa5511ba38e1ad3e2b9cf40bbc405813f9ec9029fbf673773900887118c0c6b8ac6aa8e4ca92e4ceff3394e35fc8e636')

build() {
  cd "vomit-sync-v$pkgver"

  cargo build --release --locked -p vsync

  cd man
  make
}

package() {
  cd "vomit-sync-v$pkgver"

  install -Dm755 "target/release/vsync" "$pkgdir/usr/bin/vsync"

  install -Dm644 "man/vsync.1.gz" "$pkgdir/usr/share/man/man1/vsync.1.gz"
  install -Dm644 "cli/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
