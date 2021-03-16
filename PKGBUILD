# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=discover
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.4.0
pkgrel=1
pkgdesc="Test discovery for unittest. Backported from Python 2.7 for Python 2.4+"
arch=(any)
url="http://pypi.python.org/pypi/discover/"
license=(BSD)
makedepends=(
	python
	python2
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('30bb643af4f5ea47fff572b5c346207d')
sha256sums=('05c3fa9199e57d4b16fb653e02d65713adc1f89ef55324fb0c252b1cf9070d79')
sha512sums=('ae7035fb94580ccd7c419761334d028997e48456e17bf0a94e72bb71b28b3d9eb31e2a0ded5534dcfe1ebe74b352c508821a7ffed19256393ce743e9e741d248')

prepare(){
	cp -a $_pyname-$pkgver{,-py2}
}

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
	pushd $_pyname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		python
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	for i in "$pkgdir"/usr/bin/*
	do mv -v ${i}{,-2}
	done
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
