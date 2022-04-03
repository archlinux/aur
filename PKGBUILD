# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=nfcpy
pkgname=python-${_pkgname}
pkgver=1.0.4
pkgrel=1
pkgdesc="Module to read/write NFC tags or communicate with another NFC device"
arch=('x86_64')
url="https://github.com/nfcpy/nfcpy"
license=('custom:EUPL')
depends=(
    'python-libusb1'
    'python-ndeflib'
    'python-pydes'
    'python-pyserial'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b72c67f94b4662d615d7be7b34dd39236b572f878e25fb83dd999f57979eba1f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
