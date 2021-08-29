# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=etcd3gw
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=1.0.0
pkgrel=1
pkgdesc="A python client for etcd3 grpc-gateway v3 API"
arch=(any)
url="https://github.com/dims/etcd3-gateway"
license=(Apache)
depends=(
	python
	python-pbr
	python-requests
	python-six
	python-futurist
)
makedepends=(
	python
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-pytest
	python-hacking
	python-coverage
	python-subunit
	python-oslotest
	python-testrepository
	python-testscenarios
	python-testtools
	python-pifpaf
	python-nose
	python-pytest
	python-futurist
	python-urllib3
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('c5041f0e66d008aca3fd84a881e1a96d')
sha256sums=('0a97cb0baf0623db6027443caae0dd9bd271f0d9496196f5487b4b9fa083a54a')
sha512sums=('d1aac81ebd221277c03bbb0f5dd76bb7c99a52132113959cf397fd44a598ade77300d506e2e5cfa04864cfd6a16f40ea8ddd350a4763a30609d8d922224c78ac')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
	sphinx-build -b text doc/source doc/build/text
}

check(){
	cd $_pyname-$pkgver
	python -m pytest
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/text "$pkgdir/usr/share/doc/$pkgname"
	rm -r "$pkgdir/usr/share/doc/$pkgname/.doctrees"
}
