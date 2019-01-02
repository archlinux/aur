# Contributor: Tomas Kopecny aka Georgo10 <georgo10@gmail.com>
# Contributor: scorpfa
# Contributor: fi-dschi <fi-dschi_archlinux - at - arcor - dot - de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>


pkgname=mucommander
pkgver=0.9.3
_pkgver=0.9.3-2
pkgrel=1
pkgdesc="A lightweight, cross-platform file manager with a dual-pane interface written in Java"
url="http://www.mucommander.com"
depends=('java-runtime' 'bash')
arch=('any')
license=('GPL')
source=(https://github.com/mucommander/mucommander/releases/download/${_pkgver}/${pkgname}_${pkgver}_all.deb)
sha256sums=('b3f339eadd8e9becd5911ad1792bbb2bb1de2f26896dcb54c533796f12af14d5')


prepare() {
  cd $srcdir

  # Extracting files
  tar -xf data.tar.gz
  # sed 's/\o015/\n/g' $srcdir/usr/share/$pkgname/mucommander.sh > mucommander.tmp && mv -f mucommander.tmp $srcdir/usr/share/$pkgname/mucommander.sh
  sed -i 's|MUCOMMANDER_JAR=$CURRENT_DIR/mucommander.jar|MUCOMMANDER_JAR=/usr/share/mucommander/mucommander.jar|' $srcdir/usr/share/$pkgname/mucommander.sh
}



package() {
  cd $srcdir


  # Install jars
  install -Dm644 ${srcdir}/usr/share/${pkgname}/${pkgname}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar

  # Install license
  install -Dm644 ${srcdir}/usr/share/${pkgname}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt

  # Install icon
  install -Dm644 ${srcdir}/usr/share/pixmaps/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  # Install desktop file
  install -Dm644 ${srcdir}/usr/share/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Install run script
  install -Dm755 ${srcdir}/usr/share/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

}
