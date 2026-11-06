# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('make' 'go')
provides=("${_appname}")

depends=('keepassxc')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('390ac26315e6ef7ee6d7ffe5c589b6e3af4779844c64926585be4596f67af8ef')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	make install DESTDIR="${pkgdir}" PREFIX="/usr"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
