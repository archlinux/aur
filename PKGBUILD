# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-bootstrap-scss
_pycname=XStatic-Bootstrap-SCSS
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.4.1.0
pkgrel=1
pkgdesc="Bootstrap-SCSS 3.4.1 (XStatic packaging standard)"
arch=(any)
url="https://github.com/twbs/bootstrap-sass"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-xstatic-bootstrap
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-bootstrap
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('01b41f33c6c57d1a5d59f41ce360bdd0')
sha256sums=('5cb56f0090cb6489d643730de57c68d8a6714f2b9fe526ac89bb68f5d77dfe10')
sha512sums=('feb615cfed466cfdab62402cc544578395ad0827f8618ae59af3c1e72059e094a32367f624a50efe06fba44bf03d5101ef75e643abda8368eb9468c4a1b162c6')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-bootstrap
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-bootstrap
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
