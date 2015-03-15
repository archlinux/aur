# Maintainer: Leonidas Spyropoulos (artafinde at gmail dot com)
# Contributor: scrawler@gmail.com

pkgname=freeplane
pkgver=1.3.15
pkgrel=1
pkgdesc="A Java mindmapping tool"
arch=('i686' 'x86_64')
url="http://freeplane.sourceforge.net"
license=('GPL')
makedepends=('unzip')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_bin-${pkgver}.zip
        freeplane.png freeplane.desktop freeplane.run)
md5sums=('5b53a13bb60a7f8bfbab7a178f9e47fa'
         'ca1ce05e60924f08a6b1dcefddcf43c1'
         '85d40893aef0b71f9ffdf2dec4fbb0f0'
         'f1505d5b6872e2dffe8ef2e82d065551')

package() {
  # Create required directories
  mkdir -p ${pkgdir}/usr/share/freeplane/core
  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core
  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF
  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
 
  mkdir -p ${pkgdir}/usr/share/freeplane/resources
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/ortho
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/templates
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/xslt
  
  mkdir -p ${pkgdir}/usr/share/freeplane/scripts

  cd ${srcdir}/${pkgname}-${pkgver}
  for file in $( find plugins -type f ) ; do
    install -Dm644 ${file} ${pkgdir}/usr/share/freeplane/${file}
  done

  install -Dm755 ${srcdir}/freeplane.run ${pkgdir}/usr/bin/freeplane
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/freeplane.sh ${pkgdir}/usr/share/freeplane/freeplane.sh
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/init.xargs ${pkgdir}/usr/share/freeplane/init.xargs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/props.xargs ${pkgdir}/usr/share/freeplane/props.xargs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/license.txt ${pkgdir}/usr/share/freeplane/licence.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplane.l4j.ini ${pkgdir}/usr/share/freeplane/freeplane.l4j.ini
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplaneConsole.l4j.ini ${pkgdir}/usr/share/freeplane/freeplaneConsole.l4j.ini
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplaneIcons.dll ${pkgdir}/usr/share/freeplane/freeplaneIcons.dll
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gitinfo.txt ${pkgdir}/usr/share/freeplane/gitinfo.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplanelauncher.jar ${pkgdir}/usr/share/freeplane/freeplanelauncher.jar
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/framework.jar ${pkgdir}/usr/share/freeplane/framework.jar

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/core/org.freeplane.core/META-INF/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/core/org.freeplane.core/lib/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/ortho/* ${pkgdir}/usr/share/freeplane/resources/ortho/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/templates/* ${pkgdir}/usr/share/freeplane/resources/templates/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/xslt/* ${pkgdir}/usr/share/freeplane/resources/xslt/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/gitinfo.properties ${pkgdir}/usr/share/freeplane/resources/gitinfo.properties
 
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/scripts/* ${pkgdir}/usr/share/freeplane/scripts/
  
  # Install the documentation 
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/doc/freeplane.mm ${pkgdir}/usr/share/freeplane/doc/freeplane.mm
  # Install the desktop entry
  install -Dm644 ${srcdir}/freeplane.desktop ${pkgdir}/usr/share/applications/freeplane.desktop
  install -Dm644 ${srcdir}/freeplane.png ${pkgdir}/usr/share/pixmaps/freeplane.png
}

