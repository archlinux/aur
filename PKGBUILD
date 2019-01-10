# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Manfred Kern <manfred.kern@gmailcom>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=xom
pkgver=1.3.0
pkgrel=1
pkgdesc="A Java XML Object Model"
arch=('any')
url="http://xom.nu"
license=('LGPL')
makedepends=('apache-ant')
depends=('java-runtime')
source=("http://www.cafeconleche.org/XOM/${pkgname}-${pkgver}.tar.gz")
sha256sums=('688dff0f2faa21f597c9b6e422e97fcb66af5d8a2f0a8adb9c4d79a4a7b672c1')

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
