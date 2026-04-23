# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=greymd
_pkgname=teip
pkgname=${_pkgname}-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="Masking tape to help commands 'do one thing well'"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('4d71f4b037a63f89697c713fd034a5c7be59a9e30005ea3178e215679e868a8f')
sha256sums_x86_64=('61374d943b38187c2329d08224d6c3990282c6eb4543658dd619a55d7f1c696a')
sha256sums_aarch64=('d0fe19b32d261e6a057ccf2e3949143317199b144b8c38a23191ed8c86c64100')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

	install -Dm644 "completion/bash/${_pkgname}" "${pkgdir}//usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "completion/zsh/_${_pkgname}" "${pkgdir}//usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "completion/fish/${_pkgname}.fish" "${pkgdir}//usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
