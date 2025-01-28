# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Arthur Țițeică | arthur dot titeica with gmail
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=5.5.0
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD-2-Clause')
depends=(python-cached-property python-cryptography python-defusedxml python-dnspython python-isodate python-lxml python-pygments python-requests-kerberos python-requests-ntlm python-requests-oauthlib python-tzlocal)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-dateutil python-psutil python-pytest python-pytz python-requests-mock python-yaml)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecederstrand/exchangelib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea029651b586464929d33ea600e29ef985da42d464913edd8558388399104574')

build() {
    cd "${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${_pkgname}-$pkgver"
    pytest tests
}
