# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=exodus
pkgver=19.2.14
pkgrel=1
pkgdesc="All-in-one app to secure, manage and exchange blockchain assets"
arch=('x86_64')
url="https://exodus.io"
license=('custom:"Copyright © 2018 Exodus"')
depends=('gconf' 'gtk2' 'nss' 'libxss' 'glibc>=2.28-4')
source=("https://exodusbin.azureedge.net/releases/exodus-linux-x64-${pkgver}.zip"
	"${pkgname}.svg"
	"${pkgname}.desktop")
sha256sums=('19b2e0d2c6cf52d28efc83506785feb39502d27fc797f7d66f6f75375c1e6bd5'
            'ffafdcd0869f1c9338ba25e447698c4cfa3c8714123459ae3e63686a5312ef2e'
            '04676d81272a35a91150a7eec4640e69ca50f2e479d29fad8be90160ee74122c')

package() {
  cd $srcdir/Exodus-linux-x64

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{LICENSE*,version}
  ln -s /opt/$pkgname/Exodus $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Icons
  install -Dm644 $srcdir/$pkgname.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

  chmod -R ugo+rX $pkgdir/opt
}
