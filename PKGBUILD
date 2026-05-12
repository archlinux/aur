# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=yap
_pkgauthor=DeprecatedLuar
_pkgname=yappers-of-linux
pkgname=${_appname}pers-bin
pkgdesc="Voice typing for Linux that doesn't suck"

pkgver=1.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}" "${pkgname%%-bin}")

source=("CONFIG-${pkgver}.toml::${_urlraw}/internal/examples/config.toml"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('0f20dc49c93ee4c3661a1276197a2cc6c0c0e4535606c6db6de255f4d8a6f3a6'
            '5693af108980c4dd73c8bf6226a2b2e8692d99e2c54adbc289a38c265d5b9425'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('53ce750448cf131843c9bfebce2835e3f8ecab3d5a3d26a80bbb1b493d1cdf3f')
sha256sums_aarch64=('5d2120314ed8c7094928b017041cf308cc1421f9aef86d629ac9cd39cb1488d0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "CONFIG-${pkgver}.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.toml"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
