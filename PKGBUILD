# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jasmine
_pycname=XStatic-Jasmine
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.4.1.2
pkgrel=1
pkgdesc="Jasmine 2.4.1 (XStatic packaging standard)"
arch=(any)
url="http://jasmine.github.io/"
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
md5sums=('736937d16fd655d1f6f2096b97d8255b')
sha256sums=('bf921be423c254a5cebc2156a7fd66d8210cefd251fc2fa51f792a153bf9e82b')
sha512sums=('929c5e99ee9278b4aa6c3241433c18de7af037f75cf917cbec1de48c7400e8f3fea72accaf3a107ec98a0e57928fdd892bbd081beccf0c9148196562f9078c70')

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
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
