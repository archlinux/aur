# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paradise-runner
_gitname=toast
_appname=${_gitname}
_appexec=${_appname}-editor
pkgname=${_appname}
pkgdesc="A lightweight TUI IDE for making quick in-the-moment edits"

pkgver=0.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appexec}")
makedepends=('go' 'make')
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('7f57f8dc7c3cef0c8612d187a1285cfd34f31af9915e2046fee1897fcd9b9466')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make test
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appexec}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
