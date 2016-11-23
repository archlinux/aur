# Contributor: Hy Goldsher aka hyness <hyness-at-gmail>
# Maintainer: Hy Goldsher aka hyness <hyness-at-gmail>
pkgname=davmail
pkgver=4.7.3
pkgrel=1
pkgdesc="a POP/IMAP/SMTP/Caldav/LDAP gateway for the exchange service"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
makedepends=('unzip')
depends=('java-runtime')
[ "$CARCH" = "i686" ] && _ARCH=x86
[ "$CARCH" = "x86_64" ] && _ARCH=x86_64
_rev=2438
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-linux-${_ARCH}-$pkgver-$_rev.tgz
        $pkgname.desktop
        $pkgname.sh
        $pkgname@.system_service
        $pkgname@.user_service)
[ "$CARCH" = "i686" ] && md5sums=('ea34d5327a2883eba82d992e1a26abf0')
[ "$CARCH" = "x86_64" ] && md5sums=('ac20a753d295aa54ae89a7f93688f4e7')
md5sums+=('1df37a6120d88de8df3cb735977336ba'
          '4a88ecc8e4db82e744e35ad497ad37d9'
          '8d373851babe1d8bb860228c8b4db702'
          '271e9e66dfdb496d242c9a6102937c65')
install=$pkgname.install

package() {
  _src=$srcdir/$pkgname-linux-${_ARCH}-$pkgver-$_rev
  install -d $pkgdir/{usr/share/java/$pkgname/lib,usr/bin,etc/$pkgname}
  install -Dm644 $_src/$pkgname.jar $pkgdir/usr/share/java/$pkgname/
  install -D $_src/lib/* $pkgdir/usr/share/java/$pkgname/lib
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/share/java/$pkgname
  ln -s /usr/share/java/$pkgname/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname\@.system_service ${pkgdir}/usr/lib/systemd/system/$pkgname\@.service
  install -Dm644 $srcdir/$pkgname\@.user_service ${pkgdir}/usr/lib/systemd/user/$pkgname\@.service

  # Create icons
  cd $_src
  unzip -q $pkgname.jar tray2.png tray32.png tray48.png
  install -Dm644 tray2.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/$pkgname.png
  install -Dm644 tray32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/$pkgname.png
  install -Dm644 tray48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/$pkgname.png
}
