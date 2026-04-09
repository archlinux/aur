# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=abhishekayu
_gitname=portrm
_appname=ptrm
pkgname=${_gitname}-bin
pkgdesc="Inspect active ports, understand the processes behind them, kill port conflicts, and recover broken dev environments."

pkgver=2.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'libgcc')

provides=("${_appname}")
conflicts=("${_gitname}" "${_appname}"{,-bin})

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('f21ff3403cb8589976b943519a6ab690ce19c4bdf4b53862ba47463473610ef6'
            'e79807d9d2297965ba899fd926e6818b0270d596d57bb960c7fe399bec3cc10f')
sha256sums_x86_64=('cefe7d10fd568424f571a1975dcf71157a02a36437da2ea20792deb15d62e9d1')
sha256sums_aarch64=('c363e765875506d1c5527a27f8a9940468958f43cc15e9434ed33f5fccdff871')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
