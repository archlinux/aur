# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=superradcompany
_gitname=microsandbox
_appname=${_gitname}
_appalias=msb
pkgname=${_appname}-bin
pkgdesc="Easy, fast and local-first microVM runtime"

pkgver=0.7.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}" "${_appalias}")
conflicts=("${_appname}")

makedepends=('sed')
depends=('glibc' 'libgcc' 'libcap-ng' 'libkrunfw')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appalias}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appalias}-${_barch[1]}")
sha256sums=('cdd1b6dc15e2552faba39a6bee89384abaf59efa86e13ba4cf8542c4371ed239'
            'a276ca3381fefb9cde42fccae847856085c76027557d62eee83f057eb6c53433')
sha256sums_x86_64=('bdaa6c6fc58fa3d8e85d52fc299106a013d979edd0a781b4bc6ddd21da0f8b16')
sha256sums_aarch64=('33e4f5274b9eefa3a088d0f0c8b80a5e440fd60940c0469f71a389c6998cb714')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appalias}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
