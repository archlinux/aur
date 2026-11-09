# Maintainer: Thibaut Melen <contact at qrcode-ai dot com>
# SPDX-License-Identifier: 0BSD

pkgname=qrcode-barcode-scanner-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Command-line QR code and barcode scanner with QR quality diagnostics'
arch=('x86_64')
url='https://github.com/qrcode-ai-com/qrcode-barcode-scanner'
license=('AGPL-3.0-or-later')
depends=('glibc')
provides=("qrcode-barcode-scanner=$pkgver")
# The independent qrscan-bin package provides qrscan and owns /usr/bin/qrscan.
conflicts=('qrcode-barcode-scanner' 'qrscan')
options=('!strip' '!debug')

_archive="qrcode-barcode-scanner-cli-$pkgver-x86_64-unknown-linux-gnu"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('b7c6669e332c7cc688228077b70d87f52154052e345992bd358aad6d6c7d3298')

package() {
  cd "$srcdir/$_archive" || return
  install -Dm755 qrscan "$pkgdir/usr/bin/qrscan"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE LICENSE-APACHE-2.0 THIRD-PARTY.md THIRD-PARTY-LICENSES.txt \
    COPYRIGHT-rust-std.html LICENSING.md SOURCE.md build-info.json
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
