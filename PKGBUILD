# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pcre
_pycname=python-$_pyname
pkgbase=$_pycname
pkgname=(python{,2}-$_pyname)
pkgver=0.7
pkgrel=1
pkgdesc="Python PCRE bindings"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/awahlig/python-pcre"
license=(BSD)
makedepends=(
	pcre
	python-setuptools
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('fe1333c7675ab97049e1ee183578025b')
sha256sums=('4286f3f31e9f08a8c6bff537940ce0ca86aad8eb3f78ad486620266f5099f681')
sha512sums=('aa6dd358c486a2a49836a3177f27bd32492e458075b1aaebf1a6a1b26ca5fda0697727f92ff9e58e57f944ff73da0deb8907368e1d8a5ee96e1ecda586735748')

prepare(){
	cp -a $_pycname-$pkgver{,-py2}
	sed -i '1s/ python$/ python2/g' $(find $_pycname-$pkgver-py2 -name '*.py')
}

build(){
	pushd $_pycname-$pkgver
	python setup.py build
	popd
	pushd $_pycname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		pcre
		python
	)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(
		pcre
		python2
	)
	cd $_pycname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
