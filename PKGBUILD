# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.10.0
pkgrel=1
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('8c50757f53a0599d068b456541fdba0f8ae9ddb32701b5d5abec2799cdb0a1628d9b4c46dae5ec670e26d94c24a0653880b948956ef8bcbe711de373f92c3db5')

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
