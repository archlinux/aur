# Maintainer: Eike Baran <eikebaran89@gmail.com>
pkgname=blackboard
pkgver=2.0.0.2
pkgrel=1
pkgdesc="BlackBoard Circuit Designer is intended for the hobby enthusiast and should help building prototypes on so called breadboards easily."
arch=('any')
url="https://github.com/mpue/blackboard"
license=('GPL3')
depends=('java-runtime>=11')
makedepends=('ant')
#changelog="$srcdir/$pkgrname-$pkgver/CHANGELOG.md"
source=("https://github.com/mpue/$pkgname/archive/refs/tags/$pkgver.zip" "https://raw.githubusercontent.com/mpue/blackboard/e425ce563d3a2a69b0103faa0c6dad44d1504948/build.xml")
#md5sums=('b6abc4fa95c067bf8cb36adf75583aed')
md5sums=('b6abc4fa95c067bf8cb36adf75583aed'
         '74bb7018e58e76a51d09961a885924e5')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp $startdir/build.xml $srcdir/$pkgname-$pkgver
  ant
 # mvn clean install
}

package() {

  mkdir -p $pkgdir/opt/$pkgname
#  cp -R  $srcdir/$pkgname-$pkgver/{models,symbols,parts,datasheets,simulators} "$pkgdir/opt/$pkgname/"
    
  cp -R $srcdir/$pkgname-$pkgver/dist/lib/* $pkgdir/opt/$pkgname
  
  
  cp $startdir/setup.sh $pkgdir/opt/$pkgname/
  sed -i "s/fi/fi\n sh \/opt\/blackboard\/setup.sh/" $pkgdir/opt/$pkgname/Linux_Start.sh


  chmod -R 755 $pkgdir

  install -D -m644 "$srcdir/$pkgname-$pkgver/build/icons/svg/bb_dark.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/blackboard.svg"
  install -D -m644 "$startdir/blackboard.desktop" "$pkgdir/usr/share/applications/blackboard.desktop"
#$ cp -R symbols ~/.BlackBoard
#$ cp -R parts ~/.BlackBoard
#$ cp -R datasheets ~/.BlackBoard
#$ cp -R simulators ~/.BlackBoard	

  #install -D -m644 "$srcdir/$pkgrname-$pkgver/target/jds-$pkgver.jar" "$pkgdir/usr/share/java/JDigitalSimulator/jds.jar"
  #install -D -m644 "$srcdir/$pkgrname-$pkgver/target/classes/lc/kra/jds/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/jdigitalsimulator.png"
  #install -D -m755 "$startdir/JDigitalSimulator" "$pkgdir/usr/bin/JDigitalSimulator"
  #install -D -m644 "$startdir/jdigitalsimulator.desktop" "$pkgdir/usr/share/applications/jdigitalsimulator.desktop"
  #make DESTDIR="$pkgdir/" install
}
