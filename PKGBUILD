# Maintainer: Henrik Laxhuber henrik -at- laxhuber.com

_pkgname=texlab
pkgname=${_pkgname}-git
pkgver=r1267.8ae99ec
pkgrel=3
pkgdesc="An implementation of the Language Server Protocol for LaTeX"
arch=('any')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
conflicts=("${_pkgname}" "${_pkgname}-bin")
depends=('gcc-libs')
makedepends=('rustup')
source=('texlab-git::git+https://github.com/latex-lsp/texlab.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "$srcdir/${pkgname}"
	cargo +stable build --release --locked
}

check() {
	cd "${srcdir}/${pkgname}"
	cargo +stable test --release --all --locked
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
