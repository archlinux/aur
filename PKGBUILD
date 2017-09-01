# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=exodus-eden
pkgver=1.33.1
pkgrel=1
pkgdesc="An unsupported, advanced version of Exodus"
arch=('x86_64')
url="https://exodus.io/eden"
license=('custom:"Copyright © 2017 Exodus"')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://exodusbin.azureedge.net/releases/exodus-eden-linux-x64-${pkgver}.zip"
	"http://marceloneil.com/exodus-icons/eden-icons.zip"
	"${pkgname}.desktop")
sha256sums=('e8e706d1c39b6eb398b95bc2e863ab838805b19eb3b92d4270d74855f4036256'
            '531447b0b49a27a4169fcd2639fa793135acf2776b05f52f36557b384bace7cb'
            '820c6de206ffdd5882f26a8b7d5a2720d0b2df6f9fe62d31aa3a9aaefb9b6322')

package() {
  cd $srcdir/ExodusEden-linux-x64

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{LICENSE*,version}
  ln -s /opt/$pkgname/ExodusEden $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  #Icons
  for i in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm644 $srcdir/eden-icons/icon_$i.png \
		   $pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done
  chmod -R ugo+rX $pkgdir/opt
}
