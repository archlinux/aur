pkgname="period04"
pkgver=1.2.9.3
pkgrel=1
pkgdesc="Period04 is a computer program especially dedicated to the statistical analysis of large astronomical time series containing gaps"
arch=("x86_64")
url='http://period04.net/'
license=('custom')
makedepends=('git' 'java-environment-common' 'java-runtime-common' 'ant' 'boost')
depends=('java-environment-common' 'java-runtime-common')
source=("git+https://gitlab.com/patdb/period04-public.git" "period04")
sha256sums=('SKIP' 'dd5ca330f45377f791c171b3b2c899db5a6a29385f48ed3fbf94893447f607a1')


build() {
    	cd "$srcdir/${pkgname}-public/${pkgname}/src/"
	sed -i 's/JAVA_HOME.*:=.*/JAVA_HOME      :=      \/usr\/lib\/jvm\/default/g' ${srcdir}/period04-public/period04/src/GNUMakefile
	sed -i 's/BOOST_ROOT.*:=.*/BOOST_ROOT      :=      \/usr\/lib/g' ${srcdir}/period04-public/period04/src/GNUMakefile
	sed -i 's/JVM_LIB_DIR.*:=.*/JVM_LIB_DIR      :=      $(JAVA_HOME)\/lib\/server/g' ${srcdir}/period04-public/period04/src/GNUMakefile
	
    	bash makeitso.sh
}

package() {
	install -d "${pkgdir}/opt/${pkgname}"
        cp "$srcdir/${pkgname}-public/${pkgname}/src/release/period04.jar" "${pkgdir}/opt/${pkgname}/"

	cd ${srcdir}
	install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${period04}
}

