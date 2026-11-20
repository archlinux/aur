# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=shellroute
_gitname=shellroute-cli
_appname=${_gitname%-cli}
pkgname=${_gitname}-bin
pkgdesc="A proxied shell for terminal workflows. Open a session and run commands through a proxy."

pkgver=0.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('zsh')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('2e778e72264168945689d0c54c7e4a2741ebbd5afc71abf2cb964f8895c0363b')
sha256sums_x86_64=('efaa4636c8960adf4270c02690117712f3ddf748b1473f62f60521eb76d0ef19')
sha256sums_aarch64=('2d47dfe19caa789317c4dcc4480a73a91503163ffcb3434bc26e3d0dcb036797')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
