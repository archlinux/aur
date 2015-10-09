# Maintainer: David Runge <dave@sleepmap.de>
pkgname=easytranscript
pkgver=2.50.4
pkgrel=1
pkgdesc="Easy to use transcription-software with a high feature volume"
arch=('i686' 'x86_64')
url="http://e-werkzeug.eu/index.php/en/products/easytranscript"
license=("GPL3")
depends=('java-openjfx' 'java-commons-logging' 'java-commons-io' 'java-commons-collections' 'vlc')
makedepends=('java-environment-openjdk=8' 'unzip')
source=("${pkgname}-${pkgver}.zip::http://www.e-werkzeug.eu/software/easytranscript/versions/${pkgver}/${pkgname}.zip" 'easytranscript.desktop' 'easytranscript' 'manifest.txt')
md5sums=('bea5a44a1a0bb15fc38fb65594b264c3'
         'd8c3e78dae9269431b0411c04f6ae489'
         '54f0a79ac82d5d692413980c056b81e7'
         '49175d9f86bb844a0aa78166289ca12d')

build() {
  cd "$srcdir"
  rm -rf new-manifest
  mkdir new-manifest
  cd new-manifest
  cp ../${pkgname}.jar .
  jar xvf ${pkgname}.jar
  rm ${pkgname}.jar
  jar cfm ${pkgname}.jar ../manifest.txt de testing
}

package() {
  cd "$srcdir"
  install -Dm 644 "README (Troubleshooting Linux).txt" $pkgdir/usr/share/doc/${pkgname}/README
  install -d $pkgdir/usr/share/java/${pkgname}/
  install -Dm 644 easysysteminspector.jar $pkgdir/usr/share/java/${pkgname}/easysysteminspector.jar
  install -Dm 644 new-manifest/${pkgname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
  install -Dm 644 updater.jar $pkgdir/usr/share/java/${pkgname}/updater.jar
  install -Dm 644 libJXGrabKey.so $pkgdir/usr/share/java/${pkgname}/libJXGrabKey.so
  install -d $pkgdir/usr/share/java/${pkgname}/lib/
  install -Dm 755 lib/{AbsoluteLayout,beansbinding-1.2.1,commons-net-3.3,commons-vfs-2.0,dom4j-1.6.1,jdom-2.0.5,jintellitype-1.3.9,jna-3.5.2,JXGrabKey,mail,platform-3.5.2,poi-3.10,poi-ooxml-3.10,poi-ooxml-schemas-3.10,vlcj-3.2.0,xmlbeans-2.3.0}.jar $pkgdir/usr/share/java/${pkgname}/lib/
  install -Dm 755 lib/libJXGrabKey.so $pkgdir/usr/share/java/${pkgname}/lib/
  install -Dm 755 ${pkgname} $pkgdir/usr/bin/${pkgname}
  install -Dm 644 logo.ico $pkgdir/usr/share/icons/${pkgname}.ico
  install -Dm 644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
