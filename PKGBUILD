# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.2.1
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
sha256sums=('fd7568325766b9de04f0ee9ed1220087ee02714cc286090927ab56c224b338e9')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	env -u LDFLAGS make build VERSION="${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	env -u LDFLAGS  make install DESTDIR="${pkgdir}" PREFIX="/usr" VERSION="${pkgver}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
