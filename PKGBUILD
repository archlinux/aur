# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-objectpath
_pycname=XStatic-objectpath
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.1.0
pkgrel=1
pkgdesc="objectpath 1.2.1 (XStatic packaging standard)"
arch=(any)
url="https://github.com/mike-marcacci/objectpath"
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
md5sums=('680a5e23a3d362db0b0721e5620dd6fc')
sha256sums=('cd1e9f502482afcdd028821148843b07b4065c8dcea8e5cc33abb9ae1cf20b20')
sha512sums=('b68134691ba65ff9c890f0a24255987878e01ee0324b4f38a64a3422490a58bf19978df1af2f7b4b1538aff99841e1b06641fda09509ca7b385ff7979f2e3455')

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
