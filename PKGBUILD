# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=transip-api
pkgname=python-${_pkgname}
pkgver=0.4.1
pkgrel=1
pkgdesc="Python implementation of TransIP's API (unofficial)"
arch=('any')
url="https://github.com/benkonrath/transip-api"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-rsa' 'python-requests' 'python-suds-jurko')
source=("https://github.com/benkonrath/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e3bb49a17be599ec5cce4cbc4046eeedcc4073b50bb11c18e09cc8885a317c4777f9166e48e2ad47efdcee61c6b0c34ce105e1ca7c050963fdd9fc7201514152')

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
