# Maintainer: Thibaut Melen <contact at qrcode-ai dot com>
# SPDX-License-Identifier: 0BSD

pkgname=qrcode-barcode-scanner-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='Command-line QR code and barcode scanner with QR quality diagnostics'
arch=('x86_64')
url='https://github.com/qrcode-ai-com/qrcode-barcode-scanner'
license=('MIT')
depends=('glibc')
provides=("qrcode-barcode-scanner=$pkgver")
# The independent qrscan-bin package provides qrscan and owns /usr/bin/qrscan.
conflicts=('qrcode-barcode-scanner' 'qrscan')
options=('!strip' '!debug')

_archive="qrcode-barcode-scanner-cli-$pkgver-x86_64-unknown-linux-gnu"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('1e6aea17507d22b13a370de3531697264dc748f34a1039425e892c3ee008217c')

package() {
  cd "$srcdir/$_archive" || return
  install -Dm755 qrscan "$pkgdir/usr/bin/qrscan"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE LICENSE-APACHE-2.0 THIRD-PARTY.md THIRD-PARTY-LICENSES.txt \
    COPYRIGHT-rust-std.html LICENSING.md SOURCE.md build-info.json
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
