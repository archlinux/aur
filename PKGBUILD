# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=wilfredinni
_gitname=noodle
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A delicious REST client for your terminal"

pkgver=0.8.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('17f3d317f3bc890f7542b55834cf21de8b6aea4445f13efaddaccd7baef3dee5'
            'fcf353912854f70ba3768b3755a934d16b8cbc98ed183cc1e8124639b179ef01')
sha256sums_x86_64=('f1ece2666c79054f6f6c120d1efb7b08b1660dddca5c2b6638f3a5a9bbc4ad04')
sha256sums_aarch64=('378e5878f9ccfb5e386924e4d2d8532b16d3105c84915f05834a7c50df74d1f1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
