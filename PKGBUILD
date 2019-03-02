# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=exodus-eden
pkgver=19.3.2
pkgrel=1
epoch=1
pkgdesc="An unsupported, advanced version of Exodus"
arch=('x86_64')
url="https://exodus.io/eden"
license=('custom:"Copyright © 2018 Exodus"')
depends=('gconf' 'gtk2' 'nss' 'libxss' 'glibc>=2.28-4')
source=("https://exodusbin.azureedge.net/releases/eden/exodus-eden-linux-x64-${pkgver//_/-}.zip"
	"${pkgname}.svg"
	"${pkgname}.desktop")
sha256sums=('e7b9546cecef7f38de880f28939d210b6a02bd9cbef9a81b5439dd29586e6598'
            '231eacce811bdbbf5ffbee3c677ed53df7ed41024af49c757d2f866159180031'
            '820c6de206ffdd5882f26a8b7d5a2720d0b2df6f9fe62d31aa3a9aaefb9b6322')

package() {
  cd $srcdir/ExodusEden-linux-x64

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{LICENSE*,version}
  ln -s /opt/$pkgname/ExodusEden $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Icons
  install -Dm644 $srcdir/$pkgname.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

  chmod -R ugo+rX $pkgdir/opt
}
