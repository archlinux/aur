# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=kata
pkgname=${_pkgname}-bin
pkgdesc="Local-first issue tracking for AI-assisted software work, with an agent-friendly CLI and human-facing TUI."

pkgver=0.19.0
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
sha256sums=('6c7a16b050ba7416f4410e9735dc3de33783499f0ceda5c0530756a97b3f60cb'
            '77b16a7a87405e03d51a356a8f15f4e6aeaa36a63ffa67a8f96df3c5a2f63a27')
sha256sums_x86_64=('05e0dad288b0c9eee2d983db320ff5996d8bd142313bc00db34685c135c739b5')
sha256sums_aarch64=('ecf99fd0b19f5336e49af680b800b5bc73116b5dd0f749295e5cb3b6bbb9d018')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
