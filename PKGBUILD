# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=bitaddress-git
pkgver=3.3.0.r0.g72aefc0
pkgrel=1
pkgdesc="JavaScript Client-Side Bitcoin Wallet Generator"
arch=('any')
url="https://www.bitaddress.org"
license=('MIT')
depends=('bash')
makedepends=('grunt-cli' 'git' 'npm')
source=("${pkgname}::git+https://github.com/pointbiz/bitaddress.org.git"
  "bitaddress.sh"
  "bitaddress.desktop")
sha256sums=("SKIP"
  "a5798c819761e4367e307c2eba3d29232b65b6f44ae80827fbd18783a55acd7e"
  "5208ec3016cf12a7f1b1d62802cd488817aa3cef26fb7e672b52251cd40af276")

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}" || exit
  npm install
  grunt
}

package() {
  # Install License (License is in README)
  install -Dm644 $pkgname/README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"

  # Install html file
  install -Dm644 $pkgname/bitaddress.org.html "$pkgdir/usr/share/$pkgname/bitaddress.org.html"

  # Install binary
  install -Dm755 bitaddress.sh "${pkgdir}/usr/bin/bitaddress"

  # Install desktop launcher
  install -Dm644 bitaddress.desktop "${pkgdir}/usr/share/applications/bitaddress.desktop"
}
