# Contributor: Hy Goldsher aka hyness <hyness-at-gmail>                
# Maintainer: Hy Goldsher aka hyness <hyness-at-gmail>
pkgname=davmail
pkgver=4.6.1
pkgrel=1
pkgdesc="a POP/IMAP/SMTP/Caldav/LDAP gateway for the exchange service"
arch=('i686' 'x86_64')
url="http://davmail.sourceforge.net/"
license=('GPL')
makedepends=('unzip')
depends=('java-runtime')
[ "$CARCH" = "i686" ] && _ARCH=x86
[ "$CARCH" = "x86_64" ] && _ARCH=x86_64
_rev=2343
source=(http://downloads.sourceforge.net/davmail/davmail-linux-${_ARCH}-$pkgver-$_rev.tgz davmail.desktop davmail.sh)
[ "$CARCH" = "i686" ] && md5sums=('fca2eb85f8837ee422c39c6e8ab0c59b')
[ "$CARCH" = "x86_64" ] && md5sums=('14eca55ae689116dc75c8fae09da2ca1')
md5sums+=('1df37a6120d88de8df3cb735977336ba' '4a88ecc8e4db82e744e35ad497ad37d9')
install=davmail.install

package() {
  _src=$srcdir/davmail-linux-${_ARCH}-$pkgver-$_rev
  install -d $pkgdir/{usr/share/{java/$pkgname/lib,applications},usr/bin}
  install $_src/davmail.jar $pkgdir/usr/share/java/$pkgname/
  install -D $_src/lib/* $pkgdir/usr/share/java/$pkgname/lib
  install -m755 ${srcdir}/davmail.sh $pkgdir/usr/share/java/$pkgname
  ln -s /usr/share/java/$pkgname/davmail.sh $pkgdir/usr/bin/davmail
  install -Dm644 ${srcdir}/davmail.desktop ${pkgdir}/usr/share/applications/

  # Create icons
  cd $_src
  unzip -q davmail.jar tray2.png tray32.png tray48.png
  install -Dm644 tray2.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/davmail.png
  install -Dm644 tray32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/davmail.png
  install -Dm644 tray48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/davmail.png
}

