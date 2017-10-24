# Maintainer: David Runge <dave@sleepmap.de>
pkgname=easytranscript
pkgver=2.50.7
pkgrel=3
pkgdesc="Easy to use transcription-software with a high feature volume"
arch=('i686' 'x86_64')
url="http://e-werkzeug.eu/index.php/en/products/easytranscript"
license=('GPL3')
depends=('java-openjfx' 'java-commons-logging' 'java-commons-io' 'java-commons-collections' 'vlc')
makedepends=('java-environment-openjdk=8' 'unzip')
source=("${pkgname}-${pkgver}.zip::https://www.e-werkzeug.eu/software/easytranscript/versions/${pkgver}/${pkgname}.zip"
  'easytranscript.desktop'
  'easytranscript'
  'manifest.txt')
sha512sums=('23e7f5f1e535a35510a1d2369227653c3fa619fccd1741f720c01ca24e865c9e9407a8908d27c2758fa5c6ab15e481c95df3b8af946e1f5f5f653274cd61d159'
            '210a9ef94a3d068e58392ff5d4aed85f4665d8fd614a6aa809ab7e7357b68b689788bf72da508650808e722f862f7c1b25c3f61babb15582b4ffc9593ae34a21'
            '0284a7505437bd68c484f307ee674716e6d955b8e2e8eba391f596bc4535e5a804d13274de968fd6c154f4e1728a4a54d665e6f204135bc5c8e386233b4f25bd'
            '1172946149ee0b56808f3a5d37aed3561c24e968fc861b628cc65f9c49f6501bb9097993ee38510f215c3d7f1bf467616c6130b3e16e05142dbba92e25531ed4')

build() {
  cd "$srcdir/${pkgname} zip"
  rm -rf new-manifest
  mkdir new-manifest
  cd new-manifest
  cp "../${pkgname}.jar" .
  jar xvf "${pkgname}.jar"
  rm "${pkgname}.jar"
  jar cfm "${pkgname}.jar" "${srcdir}/manifest.txt" de testing
}

package() {
  cd "$srcdir/${pkgname} zip"
  install -Dm 644 "README (Troubleshooting Linux).txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 easysysteminspector.jar \
    "${pkgdir}/usr/share/java/${pkgname}/easysysteminspector.jar"
  install -Dm 644 "new-manifest/${pkgname}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm 644 updater.jar \
    "${pkgdir}/usr/share/java/${pkgname}/updater.jar"
  install -Dm 644 libJXGrabKey.so \
    "${pkgdir}/usr/share/java/${pkgname}/libJXGrabKey.so"
  install -t "$pkgdir/usr/share/java/${pkgname}/lib/" -Dm 755 \
    lib/{AbsoluteLayout,beansbinding-1.2.1,commons-net-3.3,commons-vfs-2.0,dom4j-1.6.1,jdom-2.0.5,jintellitype-1.3.9,jna-3.5.2,JXGrabKey,mail,platform-3.5.2,poi-3.10,poi-ooxml-3.10,poi-ooxml-schemas-3.10,vlcj-3.2.0,xmlbeans-2.3.0}.jar
  install -Dm 755 lib/libJXGrabKey.so "${pkgdir}/usr/share/java/${pkgname}/lib/"
  install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 logo.ico "${pkgdir}/usr/share/icons/${pkgname}.ico"
  install -Dm 644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
