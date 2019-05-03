# Maintainer: Henrik Laxhuber henrik -at- laxhuber.com

_pkgname=texlab
pkgname=${_pkgname}-git
pkgver=r254.0d1575f
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol for LaTeX"
arch=('any')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'gradle')
source=('texlab-git::git+https://github.com/latex-lsp/texlab.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "$srcdir/${pkgname}"
	chmod +x gradlew
	./gradlew build
}

package() {
	cd "$srcdir/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	mkdir -p "$pkgdir/usr/share/java/${_pkgname}"

	cp LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	chmod 644 "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	cp "build/libs/texlab.jar" "$pkgdir/usr/share/java/${_pkgname}"

	echo ""
	echo "IMPORTANT:"
	echo "The texlab.jar server has been installed under:"
	echo "    /usr/share/java/${_pkgname}"
	echo "Configure your editor plugin to point here!"
	echo ""
}
