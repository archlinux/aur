# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# Sorry for stealing your logo from Twitter BrashMonkey, but I couldn't find any in the archive...

_pkgname=spriter
pkgname=spriter-bin
pkgver=R9
pkgrel=1
pkgdesc="The Ultimate 2D Game Animation Solution."
arch=('x86_64' 'i686')
url="https://brashmonkey.com/"
license=('custom')
depends=('')
source_x86_64=("https://brashmonkeygames.com/spriter/Spriter_free.tar.gz")
source_i686=("https://brashmonkeygames.com/spriter/Spriter_free32.tar.gz")
source=("spriter.sh"
        "spriter.desktop"
        "spriter.png")
md5sums=('c9639ecd33ba9bded2051983e307b1bf'
         '895b85114171113f1ac90ce6f68b4b9c'
         '62921fa880e04cb5c8d16ee404aed445')
md5sums_x86_64=('ceecb903311c739455b62ebd50a4a019')
md5sums_i686=('c239bd49234e7be652bfd6760a18810f')

if [ "$CARCH" == "x86_64" ]; then
  ARCHDIR="SpriterR9(64)"
else
  ARCHDIR="SpriterR9(32)"
fi

package() {
  mkdir -p $pkgdir/opt/spriter
  cp -dr --no-preserve=ownership $srcdir/$ARCHDIR/* $pkgdir/opt/spriter

  # Wrong permissions on several files...
  # eg /opt/spriter/libsteam_api.so
  chmod -R +r $pkgdir/opt/spriter/

  # Startfile & desktop file
  install -Dm755 $srcdir/spriter.sh $pkgdir/usr/bin/spriter
  install -Dm644 $srcdir/spriter.desktop $pkgdir/usr/share/applications/spriter.desktop

  # License(s)
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/opt/spriter/{SpriterEULA.txt,ReadMeQtLGPL.txt} $pkgdir/usr/share/licenses/$pkgname/
  ln -s /usr/share/licenses/$pkgname/{SpriterEULA.txt,ReadMeQtLGPL.txt} $pkgdir/opt/spriter/

  # Icon for the application launcher
  install -Dm644 $srcdir/spriter.png $pkgdir/usr/share/icons/spriter.png
}

# vim:set ts=8 sts=2 sw=2 et:
