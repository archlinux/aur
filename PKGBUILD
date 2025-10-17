# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=flo-at
_pkgname=minmon
pkgname=${_pkgname}-bin
pkgver=0.12.0
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
            '2ab7eb9ad19dff3d524e08167b7b7a085e89bd66c3cbe1061b4182c86e0490da')
sha256sums_x86_64=('5cea9b233781b7504ea3bc2b74e32d7c33308162cd2fc1d09a9efeca534416f4')
sha256sums_aarch64=('8050d1fe3868a54644ca32351b8e810fabc354f36af57188f36e2c53d699fe70')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "systemd.minmon-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/minmon.service"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
