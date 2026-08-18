# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Hypabolic
_gitname=Hypa-TTFX
_appname=ttfx
pkgname=${_gitname,,}-bin
pkgdesc="Hypa Terminal Text Effects"

pkgver=0.3.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('1bb3ff24275a91cce4ad6a8df4f181e20253b70a7db33995e1c04cb256d73112'
            '0b0072e3ef3ef2d067615d7c777f65b17bc10c15c888fb2ce19f36e1366f386a')
sha256sums_x86_64=('985bbe662107f7f6e9d20c84ac6ea8d81e8e9a8f30d5fbbfdcee7bcea2b8566b')
sha256sums_aarch64=('74415655f3491ce7564b8d735ef7f1f54ba1e29717d4427f30e7ce9b3dc7f07f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
