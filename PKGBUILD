# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=viu-media
_pkgname=viu
pkgname=${_pkgauthor}-bin
pkgdesc="Viu, your browser anime experience, from the terminal."

pkgver=3.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Unlicense')

depends=('glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgauthor}")

source=("COMPLETIONS-${pkgver}.bash::${_urlraw}/completions/${_pkgname}.bash"
		"COMPLETIONS-${pkgver}.fish::${_urlraw}/completions/${_pkgname}.fish"
		"COMPLETIONS-${pkgver}.zsh::${_urlraw}/completions/${_pkgname}.zsh"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
sha256sums=('d51f35f349b21a35ea9da8d456ca7af6b43beae82f99dfbabff35ca6ba22a687'
            '55a6915ef017aad6704373e04e097ce7766b275fd3d4488e7bdd4b7fb5fc7a41'
            '8e3956955897b0cd9948b60447e40bea067b716db2fa64adb288e19ce1ca83b3'
            '2ee4c86a7a3c841f5f07731cea906d0e9db0aab6cb7fd72f4e9ae02d2eb18418'
            '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e')
sha256sums_x86_64=('3e71c4daa1b3a1403f75e2163de5915544b7728452cdf14ea6addbf5cff0201f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "COMPLETIONS-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 "COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
