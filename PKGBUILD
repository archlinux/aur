# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pyngus
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.3.1
pkgrel=1
pkgdesc="Callback API implemented over Proton"
arch=('any')
url="https://github.com/kgiusti/pyngus"
license=(Apache)
makedepends=(
	python
	python-qpid-proton
	python-setuptools
	python2
	python2-qpid-proton
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('e240e95cfe58adc45aaa92789e056152')
sha256sums=('d925868637fcaf2b6a2174137d39af909d1e95f5c8a27c816b55b5a204e9240d')
sha512sums=('0e5ae71288b1e4ef2a630218322aa23fd537dcb068689f235b019e48ef94522639408be4d1dbd2e53c347ae1427024b8936a58fe005c1ea600bde82facb4c1dc')

prepare(){
	cp -a $_pyname-$pkgver{,-py2}
	sed -i '1s/ python$/ python2/g' $(find $_pyname-$pkgver-py2 -name '*.py')
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
		python-qpid-proton
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(
		python2
		python2-qpid-proton
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
