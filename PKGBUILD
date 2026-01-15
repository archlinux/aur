# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kesavan-vaisakh
pkgname=cmdfy
pkgver=0.1
pkgrel=1
pkgdesc="A command-line tool that translates natural language requests into executable shell commands"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
makedepends=('go')
depends=('glibc')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/heads/main.zip")
sha256sums=('SKIP')

prepare() {
	cd ${srcdir}/${pkgname}-main || exit 1

	sed -i -e 's/gemini-2.0-flash/gemini-2.5-flash/g' pkg/llm/gemini/gemini.go
}

build() {
	cd ${srcdir}/${pkgname}-main || exit 1

	make build
}

package() {
	cd ${srcdir}/${pkgname}-main || exit 1

	install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "Phases.md" "${pkgdir}/usr/share/doc/${pkgname}/PHASES.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
