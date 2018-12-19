# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=exodus-eden
pkgver=18.12.6
pkgrel=1
epoch=1
pkgdesc="An unsupported, advanced version of Exodus"
arch=('x86_64')
url="https://exodus.io/eden"
license=('custom:"Copyright © 2018 Exodus"')
depends=('gconf' 'gtk2' 'nss' 'libxss' 'glibc>=2.28-4')
source=("https://exodusbin.azureedge.net/releases/eden/exodus-eden-linux-x64-${pkgver//_/-}.zip"
	"http://marceloneil.com/exodus-icons/eden-icons.zip"
	"${pkgname}.desktop")
sha256sums=('d41d9bf853843e1feb2d00f3238b3ad256a9e2f7db54669bbaa204590d39340b'
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
