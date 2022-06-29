# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.5.0
pkgrel=1
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('eb77fbb958a7cea7580faf146d31c20b2ab44b89231dda55cfd7a7cade4a0366a1a773418a52b6ba37bf2631db2fbaeb68b0e3827fceb2e5a7c8a2f1cee2541e')

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
