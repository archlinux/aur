# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jeppeklh
_gitname=switchlet
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A small terminal app for switching project configuration profiles safely"

pkgver=0.20.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('c8c0a248a28bcec67d339d24786a9e22c5192cb274c02cf9fd8fb17a7129923f'
            '7169fd4fb7b754a22701ad3978931c994ad97c1ce46cba85cdb1cb69238f9bd1')
sha256sums_x86_64=('3ca412ba4df7e7193aea2a7a950c7e46a2f1b3ab9f0e97f243f059baeb5ebd7f')
sha256sums_aarch64=('6bfd7fb1e2dde592335d02c77a719c8c7e56e0884b608b4ecdca6ace47a163b7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
