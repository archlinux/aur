# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bip39tool-git
pkgver=0.3.1.r2.gab1bd64
pkgrel=1
pkgdesc="A tool for converting BIP39 mnemonic phrases to addresses and private keys"
arch=('any')
url="https://iancoleman.io/bip39"
license=('MIT')
depends=('bash')
makedepends=('python')
source=("${pkgname}::git+https://github.com/iancoleman/bip39.git"
  "bip39tool.sh"
  "bip39tool.desktop")
sha256sums=('SKIP'
            '0834e705a72c893f7ac77732a6d157fcd0772bb0e7c713df45474112c9156b67'
            'a6eb2bdcd62dbcd7e5bd183cbb67d4a18c4add7613f135d03f941250ccfdfd5f')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python compile.py
}

package() {
  # Install License
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install html file
  install -Dm644 $pkgname/bip39-standalone.html "$pkgdir/usr/share/$pkgname/bip39-standalone.html"

  # Install binary
  install -Dm755 bip39tool.sh "${pkgdir}/usr/bin/bip39tool"

  # Install desktop launcher
  install -Dm644 bip39tool.desktop "${pkgdir}/usr/share/applications/bip39tool.desktop"
}
