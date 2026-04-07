# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=unixshells
_gitname=latch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal multiplexer with built-in remote access"

pkgver=1.0.40
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('fc7721bcd981d37f339f4aad9d16fbe9491b7b59c1a5c44adf1bc13b8883de24'
            '293007430814de6eecc706aa9f929a727bd527f336ea480b656e545550d30c5b')
sha256sums_x86_64=('07dd60c7d5324ccb994c8333518bf7e9a99f2ce4c944d7a57f7523907573a68e')
sha256sums_aarch64=('0d0f2b56fd28dabc2cb4149af59888a3568828b0d658bdfb290b0f974830c29e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
