# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=xz-java
pkgver=1.6
pkgrel=1
pkgdesc="Java library for XZ and LZMA compression"
arch=("any")
url="http://tukaani.org/xz/java.html"
license=("Public Domain")
_javaver_=1.4
depends=("java-runtime>=${_javaver_}")
makedepends=("java-environment>=${_javaver_}", "unzip")
source=(http://tukaani.org/xz/${pkgname}-${pkgver}.zip)

build() {
	cd "${srcdir}"

	javac -source ${_javaver_} -target ${_javaver_} -d . -s src -cp . $(find src | grep \\.java\$)
	jar -cf ${pkgname}.jar $(find . | grep \\.class\$)
}

package() {
	cd "${srcdir}"

	install -d "${pkgdir}/usr/lib/"
	install -m 755 ${pkgname}.jar "${pkgdir}/usr/lib/"
}

sha1sums=('29cb33866bb7aae12851f01ce64e81229837a5d1')
