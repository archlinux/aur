# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=metaory
_gitname=treg
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Find the tool you installed and what it does"

pkgver=1.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('2f955049e87a2e0d88c451fcde1429719cd09211eecf91695a6fa9f240bb294b'
            '60654f818b34d897c254e8eb3b0c56da5e6f702a75975b9cf4714f9b67fc3b3c')
sha256sums_x86_64=('3a8fd5c7f213f8071b8fba46762d1a7ea165907f8a30752b11ce7b039a79a83c')
sha256sums_aarch64=('e5d0a329d5a5e2a38c0adef0d8a0b89c65b5497757ea8cc04bd59a5fd4627e2c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
