# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-bootstrap
_pycname=XStatic-Angular-Bootstrap
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.5.0.0
pkgrel=1
pkgdesc="Angular-Bootstrap 2.5.0 (XStatic packaging standard)"
arch=(any)
url="http://angular-ui.github.io/bootstrap/"
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
md5sums=('cb8629df48e822255d1057a2bc624cb6')
sha256sums=('be60686c9a29c74ceeadd787969c2bcbce39f15b30daa4949574aeca602f9f35')
sha512sums=('f533f998fac74e9226a48af47740cf92c24bb4b3cfdc0a87ae19699589b406cf1e6b34fc46aeeaf1b541d039c20a11945e1c383d0d1a5be0c46cce53349bee09')

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
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
