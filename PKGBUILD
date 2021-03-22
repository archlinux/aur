# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-fileupload
_pycname=XStatic-Angular-FileUpload
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=12.0.4.0
pkgrel=1
pkgdesc="Angular-FileUpload 12.0.4 (XStatic packaging standard)"
arch=(any)
url="https://github.com/danialfarid/angular-file-upload"
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
md5sums=('1cf48c0204783da2f71efe79039a8468')
sha256sums=('68e66efc4f2ed81438553a54646d5cc67487b05764c0003ff25ae5beb8dae21f')
sha512sums=('108c745f8e59d6bbc79bca9ba77f18ae3600f7da793311f4db269aef6c474f834a58e825d6fbf8a49d37d64e36546b8024e2bf3d20db85ffeef3b703cb9237fc')

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
