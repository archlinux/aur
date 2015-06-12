# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=eyeocr
pkgver=0.0.10
pkgrel=1
pkgdesc="Java-based text (ocr) recognizer"
arch=('i686' 'x86_64')
url="http://eyeocr.sourceforge.net/"
license=('custom')
depends=('java-runtime')
source=(http://sourceforge.net/projects/eyeocr/files/eye-alpha-10.zip eyeocr.desktop eyeocr)
md5sums=('7bca29959c25158f983ee6e1c9db009b'
         '2b3d7bbe6a5d70586d73dc64e06fae45'
         '1325fb061bca4ca318be8e2d1b9995a5')

build() {
true
}

package() {
  cd $srcdir/
  for dir in docs examples fonts memory
  do
	mkdir -p $pkgdir/usr/share/java/eyeocr/$dir
  	cd $dir
  	/bin/tar cf - * | ( cd ../../pkg/usr/share/java/eyeocr/$dir; tar xfp - )
	cd ..
  done
  find ${pkgdir}/usr/share/java/eyeocr/ -type f -exec chmod 644 '{}' \;
  install -D -m644 ./eye.jar ${pkgdir}/usr/share/java/eyeocr/eye.jar
  install -D -m644 ./lib-gi.jar ${pkgdir}/usr/share/java/eyeocr/lib-gi.jar
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/eyeocr.desktop
  install -D -m755 $srcdir/${pkgname} $pkgdir/usr/bin/${pkgname}
}
