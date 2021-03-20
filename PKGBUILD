# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.vmware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.8.0
pkgrel=1
pkgdesc="Oslo VMware library"
arch=('any')
url="https://docs.openstack.org/oslo.vmware/latest/"
license=('Apache')
depends=(
	python
	python-pbr
	python-stevedore
	python-netaddr
	python-oslo-i18n
	python-oslo-utils
	python-pyaml
	python-lxml
	python-suds-jurko
	python-eventlet
	python-requests
	python-urllib3
	python-oslo-concurrency
	python-oslo-context
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-fixtures
	python-sphinxcontrib-apidoc
)
checkdepends=(
	python-hacking
	python-fixtures
	python-testtools
	python-stestr
	python-coverage
	bandit
	python-ddt
	python-oslo-context
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('78525783e4c670adc93bd8d2ff3d23b1')
sha256sums=('07e6942db859bd40a0eec36fd36a23d01f1681a9b984acc912005a2cc4afee3e')
sha512sums=('64c5c2807dbde1f5dc5994295d92af11174bc98bb3fd85bbd0a3daf7270b307d42467cd7e72332c77b00297130c8c2bfceb4ada1e54c154f6c5fb5838f29cd98')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
	PYTHONPATH=${PWD} sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pyname-$pkgver
	PYTHONPATH=${PWD} stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
