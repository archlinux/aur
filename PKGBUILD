# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Contributor: tee <teeaur at duck dot com>

_pkgauthor=achannarasappa
_pkgname=ticker
pkgname=${_pkgname}-bin
pkgdesc="Terminal stock ticker with live updates and position tracking"

pkgver=5.2.0
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

sha256sums_x86_64=('79838ff5410a46f3e6e926dd6117499a4db7438cd6d9be56c633cfa7208ecdc6')
sha256sums_armv6h=('af3e389bc6c50c6ceb5eb76f921d10d77e85013202f4a3d895a7762f18252566')
sha256sums_aarch64=('fc257b25afd4a80b292dbd6cae481590b17d576e95de5dcde07426a9e9b02945')

package () {
	install -Dv "${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./${_pkgname} completion bash > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./${_pkgname} completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./${_pkgname} completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/t${_pkgname}.fish"
}
