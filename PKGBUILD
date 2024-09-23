# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Arthur Țițeică | arthur dot titeica with gmail
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=5.4.3
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD-2-Clause')
depends=('python-cached-property' 'python-cryptography' 'python-defusedxml' 'python-dnspython' 'python-isodate' 'python-lxml' 'python-requests-kerberos' 'python-requests-ntlm' 'python-requests-oauthlib' 'python-pytz' 'python-future' 'python-tzlocal')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-dateutil python-psutil python-pytest python-requests-mock python-yaml)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecederstrand/exchangelib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3fc47a7d00088056494cdfff98768853bf2ef8f081a2b589458661676d6debd')

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
