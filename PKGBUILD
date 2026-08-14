# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ryancswallace
_gitname=Jobman-Diagnose
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Deterministic and AI-assisted diagnostics for Jobman failures."

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

depends=('jobman')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('332efb386a704485f100664544a7b9a6642651d567d464e721c6c17c682e5884')
sha256sums_i686=('a0d3e139dddca60f0a82749544d6ef3e8965187eb7047433278c62a16063a59f')
sha256sums_aarch64=('beb933a4e7af908ffd3e1ed7fbfb828cf42dad92d49d97ee729fe9743711f7ba')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 ${_appname} "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 docs/CONFIGURATION.md "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 THIRD_PARTY_NOTICES.md "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
