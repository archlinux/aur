# Maintainer: Guoyi Zhang <guoyi zhang at malacology dot net>
# Contributor: syne <madlikene at aim dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=mesquite
pkgver=3\.81_build955
pkgrel=1
pkgdesc="A modular, extendible software for evolutionary biology, designed to help biologists organize and analyze comparative data about organisms"
arch=('any')
url="http://mesquiteproject.org"
license=('LGPL')
depends=('java-runtime=8')
source=($pkgname-${pkgver: 0: 4}::https://github.com/MesquiteProject/MesquiteCore/releases/download/v${pkgver//_/-}/Mesquite_${pkgver: 0: 4}_Linux.tgz
        $pkgname.png
        $pkgname.desktop
	$pkgname.sh
        )
md5sums=('560700a0968ea4be1eb96df3674f876d'
         '8b62ba93f95aab14a8643bf5b939f465'
         '5107a3118443aca1eac69db381d7df50'
         'f6ff62edbf95e40d21c7bceadb35ecfe')

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
