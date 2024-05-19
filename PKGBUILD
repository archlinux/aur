# Maintainer: Martino Pilia <martino.pilia@gmail.com>

_pkgname=groovy-language-server
pkgname=${_pkgname}-git
pkgver=r202.8b5fbc3
pkgrel=1
pkgdesc="A language server for Groovy"
arch=('any')
url="https://github.com/GroovyLanguageServer/groovy-language-server"
license=('Apache')
depends=('java-runtime<=19')
makedepends=('git')
source=('git+https://github.com/GroovyLanguageServer/groovy-language-server')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}" || exit 1
	bash ./gradlew build
}

package() {
	cd "$srcdir/${_pkgname}" || exit 1
	mkdir -p "$pkgdir/usr/share/java/${_pkgname}"

	cp build/libs/*.jar "$pkgdir/usr/share/java/${_pkgname}"
}
