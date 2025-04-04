# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=flo-at
_pkgname=minmon
pkgname=${_pkgname}-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0' 'MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("systemd.minmon-${pkgver}.service::${_urlraw}/systemd.minmon.service"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[1]}.tar.gz")
sha256sums=('c04d770b0fa2d71bbb20e1ca60773321f9b0d3c1d6367caaa1c4ad2a383d6ca9'
            '827e04431ccf5cbe334a7a6f24c4dea4a5a3636c27d4d91afc0a7098971ac510'
            '1c245bcffc08d2989d9dbe43aca3f89a4b7f17ee22ba683c6df314cc2a4a857e'
            'afb97989bc1a008905401decf251a1617af657d1f1e705fec93733e80e9f1d60')
sha256sums_x86_64=('eb8caa02c1da6f7d512dcb8f1859ffc6922dbdbccc7a5f6fe1bc8db41c419250')
sha256sums_aarch64=('5b308b219762d106df4f7a6f2a9be577781a6d54bfb8e89774fba62bf6bdc2a9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "systemd.minmon-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/minmon.service"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
