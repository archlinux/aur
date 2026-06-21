# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Contributor: tee <teeaur at duck dot com>

_pkgauthor=achannarasappa
_pkgname=ticker
pkgname=${_pkgname}-bin
pkgdesc="Terminal stock ticker with live updates and position tracking"

pkgver=5.3.0
pkgrel=1
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

sha256sums_x86_64=('fa4991f1c963559d0a27dec6ddc35cff411954a6f62ae3c2c3dc24d9ffedc12a')
sha256sums_armv6h=('fee26efb61f7c64f1a9b10315c790e6021bb0ea466e108887c90500c0d675a13')
sha256sums_aarch64=('98f1316362cd48a2a235bb2088fc8b7514e58aaeb6b3a3992e0b70facfde94ca')

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
