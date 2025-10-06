# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Rizal Nur A <rizal.jal2002@gmail.com>

_pkgauthor=tfkhdyt
_pkgname=geminicommit
_pkgexec=gmc
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="CLI that writes git commit messages for you with Google Gemini AI"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')

depends=('glibc')
provides=("${_pkgexec}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgexec}-${_pkgvername}-linux-${_barch[1]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'e81d2329b8a94627efd32426b53392b71d1ad0917e565ce4468138479281558c')
sha256sums_x86_64=('356f89421670bfeeba9a0fccda477bbaa238885e6bc656a3856f4bd8f3301bde')
sha256sums_aarch64=('f1c73bdc4851d3128e5e8a233f6282e255c48d87d343bfef1d6219ed98601018')

build() {
	cd "${srcdir}/" || exit

	./${_pkgexec} completion bash > ${_pkgexec}.bash
	./${_pkgexec} completion zsh > ${_pkgexec}.zsh
	./${_pkgexec} completion fish > ${_pkgexec}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 ${_pkgexec}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgexec}"
	install -Dm644 ${_pkgexec}.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_pkgexec}"
	install -Dm644 ${_pkgexec}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgexec}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
