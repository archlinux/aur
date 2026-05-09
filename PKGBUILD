# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neurosnap
_pkgname=zmx
pkgname=${_pkgname}-bin
pkgdesc="Session persistence for terminal processes"

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
_urlbin="https://zmx.sh/a"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${_urlbin}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${_urlbin}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('12f8de5d070434be6f78001aa4c6ad73f56ab6898cf7c98d3701059ba2c9d75d'
            '56bab989df218f62a6deb746b43903340291dafbc7a811e3fa0c8ea889f8f5ea')
sha256sums_x86_64=('4cc1f6b854dccdcabae4cb91bd0379a23e6f8210048af5d81e0661e594a50c28')
sha256sums_aarch64=('ca8b976883bd6dd6a147d9140fd6f625ec2910cb3a7210821a4b2858d0fc9d5c')


build() {
	cd "${srcdir}/" || exit

	./${_pkgname} completions bash > ${_pkgname}.bash
	./${_pkgname} completions zsh > ${_pkgname}.zsh
	./${_pkgname} completions fish > ${_pkgname}.fish
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -D -m644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -D -m644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 "README-${pkgver}.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
