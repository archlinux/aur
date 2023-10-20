# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Arthur Țițeică | arthur dot titeica with gmail
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=5.1.0
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD')
depends=('python-cached-property' 'python-cryptography' 'python-defusedxml' 'python-dnspython' 'python-isodate' 'python-lxml' 'python-requests-kerberos' 'python-requests-ntlm' 'python-requests-oauthlib' 'python-pytz' 'python-future' 'python-tzlocal')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-dateutil python-psutil python-requests-mock python-yaml)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecederstrand/exchangelib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('964dc2a41b55cf6ca7185b2d2a184097ce132073c55a0a893e9f57a2d1ed54f9')

build() {
    cd "${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

check() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py test
}
