# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Arthur Țițeică | arthur dot titeica with gmail
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=5.4.0
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD')
depends=('python-cached-property' 'python-cryptography' 'python-defusedxml' 'python-dnspython' 'python-isodate' 'python-lxml' 'python-requests-kerberos' 'python-requests-ntlm' 'python-requests-oauthlib' 'python-pytz' 'python-future' 'python-tzlocal')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-dateutil python-psutil python-pytest python-requests-mock python-yaml)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecederstrand/exchangelib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('065e0ad684c31889e2a39f1c3bc1b9e9f240238053f228a133df44bb1d0b5f4a')

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
