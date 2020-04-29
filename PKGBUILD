# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Manfred Kern <manfred dot kern at gmail dot com>
# Contributor: Joel Sevilleja Febrer <Joel7987 at gmail dot com>

pkgname=xom
pkgver=1.3.5
pkgrel=1
pkgdesc="A Java XML Object Model"
arch=('any')
url="http://xom.nu"
license=('LGPL')
makedepends=('apache-ant')
depends=('java-runtime')
source=("http://www.cafeconleche.org/XOM/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8723045f815dc0f04cfb63d1ac69b286991da4d9e3d5c7c0a152dd787adb8fe1')

build() {
  cd "${srcdir}"/XOM
  ant javadoc
}

package() {
  cd ${srcdir}/XOM
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}/lib
  cp -r lib/*.jar ${pkgdir}/usr/share/java/${pkgname}/lib
  rm ${pkgdir}/usr/share/java/${pkgname}/lib/junit.jar
  cp ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r apidocs ${pkgdir}/usr/share/doc/${pkgname}/
  cd  ${pkgdir}/usr/share/java/
  ln -s ${pkgname}/${pkgname}-${pkgver}.jar ${pkgname}.jar
}
