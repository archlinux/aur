# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='udf-http-range-proxy'
pkgver='1.0'
pkgrel=1
pkgdesc='Expose files inside remote UDF images through a local range-capable HTTP endpoint'
arch=('any')
url="https://github.com/RubenKelevra/${pkgname}"
license=('AGPL-3.0-only')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3f0be4326ed79ddd6583c1c1a578c0a8367eadec111a63c4ae61885331ec09c86a2b07f4dd10618f791367070e65ba33c686f02d3e30aa46d6298b3c24c21f68')

check() {
	cd -- "${srcdir}/${pkgname}-${pkgver}" || return 1
	python -m unittest discover -s tests -v
	[[ "$(python udf_http_range_proxy.py --version)" == "udf_http_range_proxy.py ${pkgver}" ]]
}

package() {
	cd -- "${srcdir}/${pkgname}-${pkgver}" || return 1
	install -Dm755 udf_http_range_proxy.py "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
