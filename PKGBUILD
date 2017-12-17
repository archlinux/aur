# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=coinbin-git
pkgver=1.3.r7.g64af126
pkgrel=1
pkgdesc="A Open Source Browser Based Bitcoin Wallet"
arch=('any')
url="https://coinb.in/"
license=('MIT')
depends=('bash')
source=("${pkgname}::git+https://github.com/OutCast3k/coinbin.git"
  "coinbin.sh"
  "coinbin.desktop")
sha256sums=('SKIP'
            '3f4cdb3fe4226a4bfceaa5924eb267c5fcd02ae5818c2003e00d6883563e2079'
            '1b74d74c6b476afe2a012a9a7e02edd0c1e635dc712262a7add22d6befe4a614')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Install License
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install coinbin application files
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r $pkgname/* "$pkgdir/usr/share/$pkgname"

  # Install binary
  install -Dm755 coinbin.sh "${pkgdir}/usr/bin/coinbin"

  # Install desktop launcher
  install -Dm644 coinbin.desktop "${pkgdir}/usr/share/applications/coinbin.desktop"
}
