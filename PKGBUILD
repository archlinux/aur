# Contributor: erm67
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=micropolis-java
_rpkgname=micropolisj
pkgver=1.6.r505
pkgrel=2
pkgdesc="Micropolis, Unix version of SimCity 1 rewrited in Java"
arch=("any")
url="https://github.com/jason17055/micropolis-java"
license=("custom:GPL-3.0")
makedepends=("apache-ant" "java-runtime>=7")
depends=("java-environment>=8")
provides=("micropolisj" "micropolis-java-git" "micropolisj-git")
source=("git+https://github.com/jason17055/micropolis-java.git"
	"LICENSE"
	"0001-Update-build.xml.patch"
	"micropolis-java.sh"
	"micropolis-java.desktop")
sha256sums=('SKIP'
            '61c025f07597bc0527bdaef8b04ba1709d83b5e4e7b1e5c409440a5955e7a0df'
            '93d3311d0152c2d9df1554c6e86ca96743067375f017beb2cc41ee0c21a5d76a'
            'b4d8007fda696c22cf161553e952beb05a1d73a4830c558ac8e249d5b583d2d0'
            '7de7124283566f8a6e6d7dbd68f9c3859a7d3efa2fab5c9ef1fa8379df928fda')


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


