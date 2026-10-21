# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paradise-runner
_gitname=toast
_appname=${_gitname}
_appexec=${_appname}-editor
pkgname=${_appname}
pkgdesc="A lightweight TUI IDE for making quick in-the-moment edits"

pkgver=0.12.2
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
sha256sums=('d1c6b8d84836a4346d30f9c2a2a3a5135da1124aad48a280be81a2119e9b71c1')


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
