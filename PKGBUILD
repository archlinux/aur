# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=transip-api
pkgname=python-${_pkgname}
pkgver=0.4.0
pkgrel=2
pkgdesc="Python implementation of TransIP's API (unofficial)"
arch=('any')
url="https://github.com/benkonrath/transip-api"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-rsa' 'python-requests' 'python-suds-jurko')
source=("https://github.com/benkonrath/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1a0711dc9eaaf4f9b8fccf77293c56ba37110fe2f9f9335f1438baaa018be562ec7b6b49f521e963227c9a12edf0af1c97fff2ef98743c3875d8a5c7fb731b1f')

build() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py build
}

check() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py test
}

package() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
