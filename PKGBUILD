# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=nfcpy
pkgname=python-${_pkgname}
pkgver=1.0.3
pkgrel=3
pkgdesc="Module to read/write NFC tags or communicate with another NFC device"
arch=('x86_64')
url="https://github.com/nfcpy/nfcpy"
license=('custom:EUPL')
depends=(
    'python-libusb1'
    'python-pyserial'
    'python-ndeflib'
    'python-pydes'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('03ea8a47d2dfe92bdc41d0751fba2b124793936f1fe7d5096dbb0fdfad5e635a')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
