# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-ui
_pkgname=sia
pkgver=v1.2.2
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://github.com/NebulousLabs/Sia-UI/releases/download/${pkgver}/Sia-UI-${pkgver}-linux-x64.zip"
        "https://github.com/NebulousLabs/Sia-UI/raw/master/assets/siaLogo.svg"
        "${_pkgname}.desktop")
sha256sums=('0163db87f814a2c8111334019c55387f822ff4a2a67b6ab6214d4e11d1baf3b8'
            'a02a534c151b49de1c6cb9f63502043ed3e06d0cbb058126198f821ec2a9a1c2'
            '56c2ee24ac0ed3f43579ecc77cae29f2f15ee75b505b01b9d37b30a2330cc489')

package() {

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{Sia-UI-${pkgver}-linux-x64.zip,LICENSE*,version}
  ln -s /opt/$pkgname/Sia-UI $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

  # Icons
  install -Dm644 $srcdir/${_pkgname}Logo.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
}
