# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.6.3
pkgrel=1
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('10d7e3a4ff0fab93acb069de571352ef85db6183f5e80b58696baa2983d32ccabb9df8f705028eadcbcc68e1c2dee426ac54efad886c7d81a948d33915f56a84')

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
