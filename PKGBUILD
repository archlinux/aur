# Maintainer: Yangtse Su <yangtsesu@gmail.com>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

_pkgname=nfcpy
pkgname=python-${_pkgname}-git
pkgver=1.0.3.r19.gacc6d32
pkgrel=1
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
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
