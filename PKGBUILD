# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-termjs
_pycname=XStatic-term.js
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.0.7.0
pkgrel=1
pkgdesc="term.js 0.0.7 (XStatic packaging standard)"
arch=(any)
url="https://github.com/chjj/term.js"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-setuptools
	python2
	python2-xstatic
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('7434ecf6f5680c293cf3806245dc946b')
sha256sums=('b5f3ab69cb638391f04254913a11b2aab08e2d51c5b81bb6a564c5a6d442bd31')
sha512sums=('bde2504b743be3cee191dc9ae42321e432a71ded850bb5b4f585e29a7bba5b3d9c7c4ceb464548b90df7c67e470f6cd6f0587bb0c65635046b58d17818151b95')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
