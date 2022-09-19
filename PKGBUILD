# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=etcd3gw
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=2.1.0
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
md5sums=('60b4b63e2eef1070c8cd7f9b0acbedbb')
sha256sums=('38c42b51c01777a323a84362ef0987a19dda6c17b828d7877761d0fda5bfd0d1')
sha512sums=('106bef3273bc934440716b81686b78fd0b7948c2baa1d36c32a9cbaa225c700037bbcbbb2384fa943b043ee8bdfc7f082bd35dab27df664f0210dd2d125148c9')

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
