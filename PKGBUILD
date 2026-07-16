# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=aube
_execname=(${_pkgname} ${_pkgname//e/r} ${_pkgname//e/x})
pkgname=${_pkgname}-bin
pkgver=1.28.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A fast Node.js package manager"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc' 'gcc-libs')
provides=("${_execname[@]}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('d12ab62ad9f4de7596b77e508910e6bcbb320f9550d665b581ce5b2e4a203e5a'
            '3938eb0983ba2962152d2a382930c1056959ff4303a272c3a9edb85bfffd0f19')
sha256sums_x86_64=('dc2728d1120efe26dfdae001654334f7ed9bb13c4fc50568d150744d151c7edb')
sha256sums_aarch64=('c2212a3a392f8fec66e85183a9c5c36931b5156c3b062731a6f7198a400560fd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	for link in ${_execname[@]}; do
		if [[ "${link}" != "${_pkgname}" ]]; then
			ln -sf "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${link}"
		fi
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
