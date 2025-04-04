# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=greymd
_pkgname=teip
pkgname=${_pkgname}-bin
pkgver=2.3.2
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
sha256sums=('f3c9a2a54c7abcc00035fb6f275332bf92f2be6403f06d954abd742595cf0a49')
sha256sums_x86_64=('0ea0caab0ae0ae8550e7cddc16ea9be4e751aa887267f8a7bb855f7eec237a8d')
sha256sums_aarch64=('a31f2162b003f0841fb69673e1ff17342ad245d8c8b20dc305b0b728898d2d0d')


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
