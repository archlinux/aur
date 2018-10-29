# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Manfred Kern <manfred.kern@gmailcom>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=xom
pkgver=1.2.11
pkgrel=1
pkgdesc="A Java XML Object Model"
arch=('any')
url="http://xom.nu"
license=('LGPL')
makedepends=('apache-ant')
depends=('java-runtime')
source=("http://www.cafeconleche.org/XOM/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d147822813d905c1ae94879994112d29ddbc07e3dc3b4f77419a4c3695797844')

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
