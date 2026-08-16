# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=zap
_appname=${_gitname}
pkgname=${_appname}-cli-bin
pkgdesc="Blazing fast file operations with gorgeous progress - modern replacement for cp, mv, rm"

pkgver=0.1.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('50d1317b1991cb772c9a92ed1b95fd38546235829f885f7faee2e56205085a45'
            'e47ee26134da1053f49b3ba41d8c376e772f1957afded5c1b71049aab6081bad')
sha256sums_x86_64=('699e01b4813a11a7d8a8f9c1f0b7e0197d2e36791bccc1c61688e937b7f2dd64')
sha256sums_aarch64=('9abb4db73b10004ec1769ed9b3d0aa5cff43711486c84b855002813db7587d30')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
