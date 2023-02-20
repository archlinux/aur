# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=vsync
pkgver=0.9.2
pkgrel=1
pkgdesc="IMAP to maildir synchronization tool"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/vomit-sync"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/vomit-sync/archive/v$pkgver.tar.gz")
sha512sums=('81e9f152659f4c3eb2609402336b9d1a9df0d183fb607c43c279924f1de37dbed636d36d59c54dc0e6036722b0bc3f665f2c2d84ab32c196d3edd58ed934c86f')

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
