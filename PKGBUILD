# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lance0
_pkgname=xfr
pkgname=${_pkgname}-bin
pkgdesc="A modern iperf3 alternative with a live TUI, multi-client server, and QUIC support"

pkgver=0.9.6
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
sha256sums=('efaf559dc65ada4f432a790a691ff24719ede211d62fb0464fbb82c431cbb153'
            '910bc6d2e004b84242fb7075d9e1e024badd3ff32d95251ebffac8e60fc9d91e'
            '64c4c2cd4a506833c956deaae8382a8fef761b2e42f3ee5303cfffc427f2b927'
            '8bfdb65dca7d8963a5dd049a69089c3eee3f151182bb5ec1c8dfb06f4c428c26'
            '066f4db9fbcb12827a42bf9bf6bfb2c5c57102557fb4a13a36d5c60ee1bc5ded'
            'b3699bdf3129bcb12f559d6dcfa597cfae1e3d2b793e90de297f90c4d25cdea0'
            'a2b22ab13af7492f75197a7e5ce71ba8e0ae01f8f27154f8383c8e8ded29c9e0')
sha256sums_x86_64=('273a1d47229da52aab1fabd97025e04aa03d0f94528de85ddd09013afc5194c5')
sha256sums_aarch64=('273a1d47229da52aab1fabd97025e04aa03d0f94528de85ddd09013afc5194c5')

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
