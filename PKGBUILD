# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-vis
_pycname=XStatic-Angular-Vis
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=4.16.0.0
pkgrel=1
pkgdesc="Angular-Vis 4.16.0 (XStatic packaging standard)"
arch=(any)
url="https://github.com/visjs/angular-visjs"
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
md5sums=('0dccc277987e79fe11e92c20a4e03721')
sha256sums=('6ffaaab864083a9502455d1bebccb2b558e0e3637e33f7f69003e132f06ec9b3')
sha512sums=('aacca8608301a4aa3a558b19d6c0adfe5b5a236d2d03d0bcb903752be87037f60bb3bd43b009e2322a1669e2bde7783f4d450fa8362d952be5ac22f35670717f')

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
