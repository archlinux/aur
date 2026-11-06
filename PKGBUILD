# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=kata
pkgname=${_pkgname}-bin
pkgdesc="Local-first issue tracking for AI-assisted software work, with an agent-friendly CLI and human-facing TUI."

pkgver=0.22.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('2b78e52e83e95d16ce452aca064c23cb61291d94b0feca14e330c10013dd7d90'
            '77b16a7a87405e03d51a356a8f15f4e6aeaa36a63ffa67a8f96df3c5a2f63a27')
sha256sums_x86_64=('3a730a11b4388e43d62ad60c4877dec531cd3e561d74f200cf8873091a28dbed')
sha256sums_aarch64=('3ebd64760f8d65bdf3c3d6fbc6b454a8f46061f0ca813d91669c9594ae9bd4e7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
