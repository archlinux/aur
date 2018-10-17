# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-ui
_pkgname=sia
pkgver=1.3.6
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://sia.tech/releases/Sia-UI-${_pkgver}-linux-x64.zip"
        "https://gitlab.com/NebulousLabs/Sia-UI/raw/master/assets/siaLogo.svg"
        "${_pkgname}.desktop")
sha256sums=('a03648be2f1758ddcf8468c0138284835780bbd17add16f37f8c2144f4d22dba'
            '8cba29d128271c309f52c008f6de9018404d561f69ae244f3fcb0c362388b806'
            '56c2ee24ac0ed3f43579ecc77cae29f2f15ee75b505b01b9d37b30a2330cc489')

package() {

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{Sia-UI-${_pkgver}-linux-x64.zip,LICENSE*,version}
  ln -s /opt/$pkgname/Sia-UI $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

  # Icons
  install -Dm644 $srcdir/${_pkgname}Logo.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
}
