# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SoCkEt7
_gitname=Livediff
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="👁️ Real-time file monitoring with beautiful, pulsing TUI diff visualization"

pkgver=0.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"CONTEXT-${pkgver}.md::${_ghurlraw}/CONTEXT.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/CHANGELOG.md"
		"USE-CASES-${pkgver}.md::${_ghurlraw}/docs/use-cases.md"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('d9c71a9fdc8f358c8fbfd563b02c2d23d64d4017e611493a4434bf0650354b1d'
            '97cf9c1a29da7db1a68b0ad12c7e2ea7eba30e89613a74c2c34b58803d6a9453'
            '879d242279ab6e6da960f7496eb25146b6279c341052e47922edcefd209a6c51'
            'cbf0e79b9dbfba8160e356bdc10348928d86bc2bbbcd5afef43c22ba98bc17c6'
            'be09529b500a8b5060c4260e2ea822fdfa44131acb116d8e1f4f24cfa9b63a9c'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('211c90a31db01673b580ec3f36ac20fdb046f33a983575cc1c9ffbfc6864a4fc')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname,,}-${_gitversion}-${_CARCH}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CONTEXT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTEXT.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "USE-CASES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USE-CASES.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
