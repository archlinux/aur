# Maintainer: framefilter <https://github.com/framefilter/keyroost>
# Rendered and pushed automatically by .github/workflows/publish.yml;
# @PLACEHOLDERS@ are substituted from the release tag and SHA256SUMS.
pkgname=keyroost-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="CLI + GUI for programming Token2 Molto2 TOTP tokens and managing FIDO2/OATH/OpenPGP/PIV security keys (prebuilt)"
arch=('x86_64')
url="https://github.com/framefilter/keyroost"
license=('MIT OR Apache-2.0')
depends=('pcsclite')
optdepends=('ccid: smart-card reader drivers'
            'pcsc-tools: reader debugging')
provides=('keyroost' 'keyroostctl')
conflicts=('keyroost')
source=("keyroost-v$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/keyroost-v$pkgver-linux-x86_64.tar.gz"
        "70-keyroost-fido-$pkgver.rules::https://raw.githubusercontent.com/framefilter/keyroost/v$pkgver/udev/70-keyroost-fido.rules")
sha256sums=('033e7378be357d49de0bcc1399761909fda1345a7f15877a5c0f2a4499d8e86c'
            '4e718383909598c88e140c86d56cbf7ebdc87ef0f3bb55aaaaa1ae238db91287')

package() {
  install -Dm755 keyroostctl "$pkgdir/usr/bin/keyroostctl"
  install -Dm755 keyroost "$pkgdir/usr/bin/keyroost"
  install -Dm644 "70-keyroost-fido-$pkgver.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-keyroost-fido.rules"
}
