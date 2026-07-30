# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lance0
_pkgname=xfr
pkgname=${_pkgname}-bin
pkgdesc="A modern iperf3 alternative with a live TUI, multi-client server, and QUIC support"

pkgver=0.9.23
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
sha256sums=('24ab49f2008db93cc23b49c51a12ae17ecbbb4ab90315146094ef07c1ee0f020'
            '82c801d7b6c9d2f1f0f1188f6945cf6f6e448e6c93ea805058ac069089979b68'
            '64c4c2cd4a506833c956deaae8382a8fef761b2e42f3ee5303cfffc427f2b927'
            'df6a649d60ae10ece9db4a3423baf58c12801499becf33650ca1af2bc717e1d6'
            '476f73c677be9226a9b0b6e098ae7d952e4cacc22698ec0099052bc22303d67e'
            'b3699bdf3129bcb12f559d6dcfa597cfae1e3d2b793e90de297f90c4d25cdea0'
            'a2b22ab13af7492f75197a7e5ce71ba8e0ae01f8f27154f8383c8e8ded29c9e0')
sha256sums_x86_64=('093ea8725c2fcd34b104a5d176437410005eea51e819884f491a32a18093c458')
sha256sums_aarch64=('093ea8725c2fcd34b104a5d176437410005eea51e819884f491a32a18093c458')

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
