# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=apache-ant-cpptasks
_pkgname=cpptasks
pkgver=1.0b5
pkgrel=2
pkgdesc="C/C++, FORTRAN and MIDL tasks for Apache Ant."
url="http://ant-contrib.sourceforge.net/cpptasks/index.html"
arch=('any')
license=('APACHE')
depends=('java-runtime' 'apache-ant' 'xerces2-java')
makedepends=('apache-ant')
source=("https://sourceforge.net/projects/ant-contrib/files/ant-contrib/${_pkgname}-1.0-beta5/${_pkgname}-${pkgver}.tar.gz")
md5sums=('7f0f7732acd0c82f7efb228f667ec79a')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed \
	    -i \
	    -e 's#property name="javac\.source" value="1.3"#property name="javac\.source" value="1.6"#' \
	    -e 's#property name="javac\.target" value="1.1"#property name="javac\.target" value="1.6"#' \
	    build.xml
	ant -lib /usr/share/java/xercesImpl.jar
}

package() {
	install -d "${pkgdir}/usr/share/java/apache-ant/"
	install "${srcdir}/${_pkgname}-${pkgver}/target/lib/${_pkgname}.jar" "${pkgdir}/usr/share/java/apache-ant/${_pkgname}.jar"	
}
