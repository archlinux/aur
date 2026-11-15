# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vincelwt
_gitname=gloomberb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Finance terminal, in your terminal"

pkgver=0.20.14
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.gz")
sha256sums=('7e8b026bf62db5b03aeab6d4f20865e3bf158ac7a98aad9ef059f79ace2f3e1d'
            '621768803b2a602fa8033ee7434d90bbda73622041c2bd26d7ce739485178728')
sha256sums_x86_64=('1be5664afc84a858b0a46cd8fc23da800ab4e3d52d2cbbba7fcc9bef1c199a6a')
sha256sums_aarch64=('cb30b7d9dd427e26ada5e61be1158214549a4ff858bf2f082fc3645e0795c9f5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
