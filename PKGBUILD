# Contributor:  Stefan Husmann <stefan-husmann@t-online.de>
# Contributor:  Alois Nespor <alois.nespor@gmail.com>

pkgname=jsword
pkgver=1.6
pkgrel=3
pkgdesc="Frontend for the jsword-engine, a sword-like bible study software written in Java."
url="http://crosswire.org/jsword"
arch=('any')
license=('GPL')
depends=('java-commons-logging' 'java-jdom1')
replaces=('bibledesktop')
conflicts=('bibledesktop')
provides=('bibledesktop')
source=(http://crosswire.org/ftpmirror/pub/jsword/release/jsword-$pkgver-bin.tar.gz $pkgname)
md5sums=('5e9bfa0a7d96324bee600df486932518'
         '26a0d1b139d4a35dabfc3a93aab9887d')
build() {
  cd $srcdir/$pkgname-$pkgver
  rm BibleDesktop.{bat,exe,ico} PortableBibleDesktop.exe lcp.bat
  rm commons-logging-1.1.1.jar jdom-1.0.jar 
  sed -i 's+"${LOCALCLASSPATH}"+"${LOCALCLASSPATH}":/usr/share/java/commons-logging/commons-logging.jar:/usr/share/java/jdom/jdom.jar+' BibleDesktop.sh
}
package() {
  install -d  $pkgdir/usr/share/$pkgname
  cp -R $srcdir/jsword-$pkgver/* $pkgdir/usr/share/$pkgname
  chmod 755 $pkgdir/usr/share/$pkgname/BibleDesktop.sh
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
