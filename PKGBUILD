# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=wrr
_gitname=drop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Productivity-focused sandboxing for Linux"

pkgver=0.1.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('passt')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"NOTICE-${pkgver}::${_ghurl}/releases/download/${_gitversion}/NOTICE"
		"LICENSE-${pkgver}::${_ghurl}/releases/download/${_gitversion}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('3a465cddb775f62394964cd33e4c2c23b462acd0b7a12a900ab8a8889556139c'
            'd78ef79ac814b25c9a02aab1a8a328b1cc5d4f603be522c072b44e70f2f3803f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('7eedd8f693373c3788d7027da6c5d69652a5ed915aa071aa392eb68a63c53631')
sha256sums_aarch64=('f3e6c19e8cc86688e9a743662a0a5711667e4eff913d331f16f4ef17c755a3d9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "NOTICE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
