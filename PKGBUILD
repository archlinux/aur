# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Contributor: tee <teeaur at duck dot com>

_pkgauthor=achannarasappa
_pkgname=ticker
pkgname=${_pkgname}-bin
pkgdesc="Terminal stock ticker with live updates and position tracking"

pkgver=5.2.1
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64' 'armv6h' 'aarch64')
_barch=('amd64' 'armv6' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0-or-later')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[0]}.tar.gz")
source_armv6h=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[2]}.tar.gz")

sha256sums_x86_64=('6c61882de840d20db449c77b4830cab945c44fd811f5f05b333160adab9098a4')
sha256sums_armv6h=('c91d7cb95ad1f255aaa87e4de18a4d7bb13f5aca8eb37018729d18fa8f23a5cb')
sha256sums_aarch64=('69058bceec7cc72b6628ab01d6f0231020b4147639795dfcf34c8ecaa88bce72')

package () {
	install -Dv "${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./${_pkgname} completion bash > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./${_pkgname} completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./${_pkgname} completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
