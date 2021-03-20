# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.reports
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.2.0
pkgrel=1
pkgdesc="Oslo Reports library"
arch=('any')
url="https://docs.openstack.org/oslo.reports/latest/"
license=('Apache')
depends=(
	python
	python-pbr
	python-jinja
	python-oslo-serialization
	python-psutil
	python-six
	python-oslo-i18n
	python-oslo-utils
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-oslotest
	python-stestr
	python-oslo-config
	python-eventlet
	python-greenlet
	python-coverage
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('9979288e77ffe302a4eb5ef5c0bc57a2')
sha256sums=('cf4a62a427ff1a832ca2b2ee98ae36eb1285e5587254ed6aad1e4502a8c32b42')
sha512sums=('dd8224a1789318572bcd3e0394c01a0c65f8a1b48afcf6a5dbf6503f310bb3f48457b9c0e9315620d8935156bd29efa30d9c1e0368480484776178875f84840d')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
