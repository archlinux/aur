# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Maintainer: syne <madlikene at aim dot com>
pkgname=mesquite
pkgver=3.10
_pkgver=310-Linux
buildver=build-765
pkgrel=1
pkgdesc="A modular, extendible software for evolutionary biology, designed to help biologists organize and analyze comparative data about organisms"
arch=('any')
url="http://mesquiteproject.wikispaces.com"
license=('(L)GPL')
depends=('java-runtime')
source=(https://github.com/MesquiteProject/MesquiteCore/releases/download/v$pkgver-$buildver/Mesquite$_pkgver.tgz
        $pkgname.png
        $pkgname.desktop
	$pkgname.sh
        )
md5sums=('6d993e949730451991c8f754ead4b852'
         '8b62ba93f95aab14a8643bf5b939f465'
         '279160bcf1544a78e0b0372279bfa68d'
	 'f6ff62edbf95e40d21c7bceadb35ecfe'
         )

package() {
  cd $srcdir/Mesquite_Folder

  # Remove bundled shell script and install own
  rm -rf $pkgdir/$pkgname.sh
  install -Dm755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
 
  # Install program files
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -r * $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 '{}' \;


  # Install a desktop entry
  install -Dm644 ../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
