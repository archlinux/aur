# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=suds-jurko
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.6
pkgrel=1
pkgdesc="Lightweight SOAP client (Jurko's fork)"
arch=(any)
url="http://bitbucket.org/jurko/suds"
license=(LGPL)
makedepends=(python)
checkdepends=(python-pytest)
conflicts=(python{,2}-suds)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip)
md5sums=('eddc4fa468d86244310c12a56f663e65')
sha256sums=('1cb7252cb13018fc32887c3a834ed7c6648a5b5c4c159be5806da2e1785399e8')
sha512sums=('a07d5ae7ad0d2fe6720df0e028938afd04df197cb22d1b0446a71f125d4115baae7f6b1304550eaaaebe8289f484be33e514563d7db1afe2c7074be48376d1e9')

prepare(){
	sed -i 's/\[pytest\]/[tool:pytest]/g' $_pyname-$pkgver/setup.cfg
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
	depends=(python)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(python2)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
