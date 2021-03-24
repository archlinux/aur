# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-uuid
_pycname=XStatic-Angular-UUID
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.0.4.0
pkgrel=1
pkgdesc="Angular-UUID 0.0.4 (XStatic packaging standard)"
arch=(any)
url="https://github.com/munkychop/angular-uuid"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-xstatic-angular
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-angular
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('52c6dc608a0dff6e9993f4166fbf552b')
sha256sums=('434a134456c2ad832c319dee1cf9aa881a3bd1cd8500c2df2a8dd5e513c2fe2b')
sha512sums=('fe8916c10405e2a24aabddc545986f94d7224d7ff8dd4d93615ac019cc67963fb3caff669d432f0a201b7b3ff4f4a828403dc7ff3b8e92e380684f07db9e9cfe')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-angular
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-angular
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
