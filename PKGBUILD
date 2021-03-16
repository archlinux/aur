# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=glance-store
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=2.5.0
pkgrel=1
pkgdesc="OpenStack Image Service Store library"
arch=(any)
url="https://docs.openstack.org/glance_store/latest/"
license=(Apache)
depends=(
	python
	python-oslo-config
	python-oslo-i18n
	python-oslo-serialization
	python-oslo-utils
	python-oslo-concurrency
	python-stevedore
	python-eventlet
	python-six
	python-jsonschema
	python-keystoneauth1
	python-keystoneclient
	python-requests
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
	python-sphinxcontrib-apidoc
)
checkdepends=(
	python-hacking
	python-doc8
	python-coverage
	python-fixtures
	python-subunit
	python-requests-mock
	python-stestr
	python-testscenarios
	python-testtools
	python-oslotest
	python-boto3
	python-oslo-vmware
	python-httplib2
	python-swiftclient
	python-cinderclient
	python-os-brick
	python-oslo-rootwrap
	python-oslo-privsep
)
source=("https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz")
md5sums=('5f22383d27958bdd17e2fe4608e89f97')
sha256sums=('4dd8e1c41d45cf32345ab17388a72e4beaa1c87523530635292722562306bd76')
sha512sums=('75a6dfc9dabe8bf2053639d3da1a8c7b0f145015331277f99e70a6be31915cb972c1876713e6cf93ff390239bcd9e3dee5ae031fbf99299953eaa44301daf359')

export PBR_VERSION=$pkgver

build(){
	cd $_pycname-$pkgver
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pycname-$pkgver
	#stestr run
}

package(){
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
	mv "$pkgdir"{/usr,}/etc
}
