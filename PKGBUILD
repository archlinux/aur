# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lance0
_pkgname=xfr
pkgname=${_pkgname}-bin
pkgdesc="A modern iperf3 alternative with a live TUI, multi-client server, and QUIC support"

pkgver=0.10.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0' 'MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"ROADMAP-${pkgver}.md::${_urlraw}/ROADMAP.md"
		"SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md"
		"CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
		"CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('16b99e8bdcb65117cc3a721355470c58582409cb460b42312fffe2346b80f4a9'
            'b40cfad8fd6aa5e5d7b45cf10f262166c867979f75844ac63ea0c73b92bced46'
            '85da7223f219783c1a79e7c544ec33fb477c3bf9b0f75bd16887c64de81a0fa9'
            '056fe5c41ed21da216c704e0ad547d150cf965d80cc4e78a8794f063e0f1b284'
            '9a8003cf32d0dbd0b178ad88bb5746d7e6afd5b1fe366c76bc5649c34755590e'
            'b3699bdf3129bcb12f559d6dcfa597cfae1e3d2b793e90de297f90c4d25cdea0'
            'a2b22ab13af7492f75197a7e5ce71ba8e0ae01f8f27154f8383c8e8ded29c9e0')
sha256sums_x86_64=('a83baa2a7d7de3fe52bc8f816de0c445fb7699a83c4f776df5b39e50663b9e62')
sha256sums_aarch64=('a83baa2a7d7de3fe52bc8f816de0c445fb7699a83c4f776df5b39e50663b9e62')

build() {
	cd "${srcdir}/" || exit

	./${_pkgname} --completions bash > ${_pkgname}.bash
	./${_pkgname} --completions zsh > ${_pkgname}.zsh
	./${_pkgname} --completions fish > ${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "ROADMAP-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
