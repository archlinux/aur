# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=TCP-RWX
_gitname=qlan
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Lightweight command-line LAN data transfer tool using UDP discovery and TCP streaming"

pkgver=0.0.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")

makedepends=('make' 'gcc')
depends=('glibc' 'libgcc')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('8a7e9c3bd148e3dd9e82148ec4fbb4e396dd8eebf61b599fa5c7dbb837d92c43')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
