# Maintainer: AsamK <asmak ät gmx de>

pkgname=libmatthew-unix-java
_pkgname=libmatthew-java
pkgver=0.5
_pkgver=0.8
pkgrel=1
pkgdesc="Library for Java: unix sockets"
arch=('i686' 'x86_64' 'armv6h' 'armv7')
url="http://www.matthew.ath.cx/projects/java"
license=('Expat')
depends=('java-runtime' 'glibc')
makedepends=('java-environment' 'gcc')
source=( "http://www.matthew.ath.cx/projects/java/${_pkgname}-${_pkgver}.tar.gz" )
sha256sums=('05d1d3d9b5e33bd3642102aae10bba904e296c5c01a10854200ad4df349c8dfa')

build() {
	cd "${srcdir}"

	cd ${_pkgname}-${_pkgver}

	JAVA_HOME="/usr/lib/jvm/default" make "unix-${pkgver}.jar" "libunix-java.so"
}

package() {
	install -m755 -d "${pkgdir}"/usr/share/java/${pkgname} "${pkgdir}"/usr/lib

	cd "${srcdir}"

	cd ${_pkgname}-${_pkgver}

	install -m 644 "unix-${pkgver}.jar" "${pkgdir}"/usr/share/java/${pkgname}

	for i in "${pkgdir}"/usr/share/java/${pkgname}/*.jar; do
		_tmpfilename=${i##*\/}
		ln -sf ${_tmpfilename} "${pkgdir}"/usr/share/java/${pkgname}/${_tmpfilename/-[0-9]\.[0-9]/}
	done

	install -m 644 libunix-java.so "${pkgdir}"/usr/lib
}
