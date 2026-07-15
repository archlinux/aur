# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=The-Robin-Hood
_gitname=ufWall
_appname=${_gitname}
pkgname=${_appname,,}-bin
pkgdesc="A terminal UI for managing UFW (Uncomplicated Firewall)"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('ufw')
provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('63cff6f4d5cbfae47c45bf8631b0799b2b0a96ff9ed968cef84888a83353ff3d'
            'b8f4f0e982bb10c429d855d6305e9ab1aed1e37b8a6e9c72b21c369be8d6216b')
sha256sums_x86_64=('3a92083df32fe6f78c0d31ca51ff55ca4b9bb232a7a32ced1f9e798458a1bd60')
sha256sums_aarch64=('2c2823191d5eb4540cfcf5fe837c7e2f6d00799f5d8b8ea497dff3a95824b1e5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
