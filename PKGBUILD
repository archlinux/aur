# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pep257
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.7.0
pkgrel=1
pkgdesc="Python docstring style checker"
arch=(any)
url="https://github.com/GreenSteam/pep257/"
license=(MIT)
makedepends=(
	python
	python2
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ff3dc9622c2406b7b583a283fbea651e')
sha256sums=('f3d67547f5617a9cfeb4b8097ed94a954888315defaf6e9b518ff1719363bf03')
sha512sums=('ebe4161aed1a2b9cc816ed065d02a19f96f7d0fac13acd67caa4dd37dcff0610a42dfd4f89fe4103cb54c907748b0463fa677be5b02b0c45150485a4c6d5d122')

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
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}

_package_python2(){
	depends=(
		python2
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
	for i in "$pkgdir"/usr/bin/*
	do mv -v ${i}{,-2}
	done
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
