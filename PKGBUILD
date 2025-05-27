# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Arthur Țițeică | arthur dot titeica with gmail
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=5.5.1
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD-2-Clause')
depends=(python-cached-property python-cryptography python-defusedxml python-dnspython python-isodate python-lxml python-pygments python-requests-kerberos python-requests-ntlm python-requests-oauthlib python-tzlocal)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-dateutil python-psutil python-pytest python-pytz python-requests-mock python-yaml)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecederstrand/exchangelib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce81ceeb02785c11d81cb0604cfed9ca4eba4be4c07afec12dbea9767b90c02a')

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
