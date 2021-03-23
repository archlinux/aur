# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-spin
_pycname=XStatic-Spin
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.5.3
pkgrel=1
pkgdesc="Spin 1.2.5 (XStatic packaging standard)"
arch=(any)
url="http://fgnass.github.io/spin.js/"
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
md5sums=('d0cad2593c74eec38dbeed5161eab462')
sha256sums=('06e889cf3318f08ce74ef888b45d9f1e09017bb8e6d519a299c10a9e6b542642')
sha512sums=('7a26f7ed3efb412a77241cc50ef78776fcb6be9a831eedee9637ca041ac6716785edc546894618cdc693419c0a55adb7db62e5a3b1c414b6504036c118dfc44e')

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
