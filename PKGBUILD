# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-ui
_pkgname=sia
pkgver=1.3.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://github.com/NebulousLabs/Sia-UI/releases/download/${_pkgver}/Sia-UI-${_pkgver}-linux-x64.zip"
        "https://github.com/NebulousLabs/Sia-UI/raw/master/assets/siaLogo.svg"
        "${_pkgname}.desktop")
sha256sums=('ef3add9794f1651a822511cb996dcbdfda845e36bb86c799a188cf026558eed5'
            'a02a534c151b49de1c6cb9f63502043ed3e06d0cbb058126198f821ec2a9a1c2'
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
