# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=transip-api
pkgname=python-${_pkgname}-git
pkgver=0.4.1.r3.g46ef59d
pkgrel=1
pkgdesc="Python implementation of TransIP's API (unofficial)"
arch=('any')
url="https://github.com/benkonrath/transip-api"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-rsa' 'python-requests' 'python-suds-jurko')
optdepends=('python-pycrypto: OpenSSH key format support')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("git+https://github.com/benkonrath/transip-api.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	python3 setup.py build
}

check() {
	cd "${_pkgname}"
	python3 setup.py test
}

package() {
	cd "${_pkgname}"
	python3 setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
