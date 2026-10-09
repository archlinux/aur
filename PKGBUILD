# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=wrr
_gitname=drop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Productivity-focused sandboxing for Linux"

pkgver=0.3.1
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
sha256sums=('31b0e6225b61f06c77f7788c1531fa5884899664aa861e0d57e327aafeeb843b'
            'd78ef79ac814b25c9a02aab1a8a328b1cc5d4f603be522c072b44e70f2f3803f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('aa21b6b9c626ae109c32b403e4eaac51c2c50f775c85e58abedde4116a86b4de')
sha256sums_aarch64=('86ae5d48b1e55cef98bbcd1d69237f5e8024eb6bcfb9559b062949fac0ca7469')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "NOTICE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
