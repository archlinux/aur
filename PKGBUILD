# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=jpdftweak
pkgver=1.1
pkgrel=2
pkgdesc="A Swiss Army Knife GUI application for PDF documents"
arch=('any')
url="http://jpdftweak.sourceforge.net/"
license=('AGPL3')
depends=('java-runtime')
install=jpdftweak.install
source=(http://downloads.sourceforge.net/jpdftweak/$pkgname-compact-$pkgver.zip \
        jpdftweak.sh jpdftweak.desktop)
md5sums=('a497589cc75b47e8f8b3e7cf22343a31'
         '8b129e219ecd593b4f8a178f2e275d23'
         '8c62361be9a7de12f86593b7e7111c22')

package() {
  cd "$srcdir"

  install -D -m644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar

  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # install the manual
  install -d -m755 "$pkgdir"/usr/share/doc/$pkgname
  cp -a manual "$pkgdir"/usr/share/doc/$pkgname
  # install icons
  for ICON in icons/*; do
    RES=`echo $ICON | tr -cd '[:digit:]'`
    install -D -m644 $ICON "$pkgdir"/usr/share/icons/hicolor/${RES}x${RES}/apps/$pkgname.png
  done
}

# vim:set ts=2 sw=2 et:
