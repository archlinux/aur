# Contributor: erm67
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=micropolis-java
_rpkgname=micropolisj
pkgver=1.6.r505
pkgrel=2
pkgdesc="Micropolis, Unix version of SimCity 1 rewrited in Java"
arch=("any")
url="https://github.com/jason17055/micropolis-java"
license=("custom:GPL3")
makedepends=("apache-ant" "java-runtime>=7")
depends=("java-environment>=7")
provides=("micropolisj" "micropolis-java-git" "micropolisj-git")
source=("git+https://github.com/jason17055/micropolis-java.git"
	"LICENSE"
	"0001-Update-build.xml.patch"
	"micropolis-java.sh"
	"micropolis-java.desktop")

pkgver() {
	cd "${pkgname}"
	echo 1.6.r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

prepare() {
	cd "${pkgname}"
	patch -Np1 < ../0001-Update-build.xml.patch
}

build() {
	cd "${srcdir}/${pkgname}"

	ant
}


package(){
	cd "${srcdir}"

	install -Dm677 "${srcdir}/${pkgname}/${_rpkgname}.jar" \
		"${pkgdir}/usr/share/micropolis-java/${_rpkgname}.jar"

	install -Dm677 "${srcdir}/${pkgname}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm677 "${srcdir}/${pkgname}/README" \
		"${pkgdir}/usr/share/doc/${pkgname}/README"

	install -Dm677 "${srcdir}/${pkgname}/build/micropolism.png" \
		"${pkgdir}/usr/share/pixmaps/${_rpkgname}.png"

	install -Dm677 "${srcdir}/micropolis-java.sh" \
		"${pkgdir}/usr/bin/micropolis-java"

	install -Dm677 "${srcdir}/micropolis-java.desktop" \
		"${pkgdir}/usr/share/applications/micropolis-java.desktop"
}

md5sums=('SKIP'
         'b95118d1c60c6649ab9403cbaa4abb86'
	 'e86ada5ce25f6016597844816ba41379'
         '666a4f5a7641791379f005b26e4851ff'
         '5d0667a3049111b4e7e9f07f1992bc01')
