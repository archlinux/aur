# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=jsonpath-rw-ext
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.2
pkgrel=1
pkgdesc="Extensions for JSONPath RW"
arch=(any)
url="https://github.com/sileht/python-jsonpath-rw-ext"
license=(Apache)
depends=(
	python
	python-pbr
	python-jsonpath-rw
	python2
	python2-pbr
	python2-jsonpath-rw
)
makedepends=(
	python-setuptools
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ae6a08e7dba446718749296ed7c1a357')
sha256sums=('a9e44e803b6d87d135b09d1e5af0db4d4cf97ba62711a80aa51c8c721980a994')
sha512sums=('28ca708023a942665c946d3e0ec618488f7d30d832e4ad0748d6c7019849f2ad19e3629c4452ab461b9c14d71f3360a4590357637f95ea44f8bc3b4544d5e0af')

export PBR_VERSION=$pkgver

prepare(){
	cp -a $_pyname-$pkgver{,-py2}
}

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
	pushd $_pyname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		python
		python-pbr
		python-jsonpath-rw
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(
		python2
		python2-pbr
		python2-jsonpath-rw
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"

