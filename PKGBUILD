# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Arthur Țițeică | arthur dot titeica with gmail
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=4.4.0
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD')
depends=('python-cached-property' 'python-cryptography' 'python-defusedxml' 'python-dnspython' 'python-isodate' 'python-lxml' 'python-requests-kerberos' 'python-requests-ntlm' 'python-requests-oauthlib' 'python-pytz' 'python-future' 'python-tzlocal')
makedepends=('python-setuptools')
checkdepends=('python-requests-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecederstrand/exchangelib/archive/refs/tags/v${pkgver}.tar.gz"
"LICENSE")
sha256sums=('eaa8bfd14fca73ded4c57dd830e5b2b759576d3fed5db9fee5b6bbfda41aee3f'
            '650d8ac6b0ab9a2c946b021bf12933cad611b6397d0eaff31beb28f6a243afa9')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install -O1 --skip-build --root="${pkgdir}"
    install -Dm0644 ../../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

check() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py test
}
