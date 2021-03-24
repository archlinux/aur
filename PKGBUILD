# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-notify
_pycname=XStatic-Angular-Notify
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.5.1.0
pkgrel=1
pkgdesc="Angular-Notify 2.5.1 (XStatic packaging standard)"
arch=(any)
url="https://github.com/cgross/angular-notify"
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
md5sums=('41c008d2861b015bc9c54efa8587798b')
sha256sums=('2c6b5a966b8223d0ae476621fe83fb8376383bf2e511040646099d6a817a1daa')
sha512sums=('0be6d4c0cca5018211d6f97f48883142138e6aced1f23b783e5373f639b4f9e8612fd38ae1dc9e9d4de4880cdb447c9d615235e073d4eaa63e3cdcd72f8b1d8f')

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
