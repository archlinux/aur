# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pymemcache
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=3.5.2
pkgrel=1
pkgdesc="A comprehensive, fast, pure Python memcached client"
arch=(any)
url="https://github.com/pinterest/pymemcache"
license=(Apache)
makedepends=(
	python
	python-six
	python-setuptools
)
checkdepends=(
	python-future
	python-mock
	python-pytest
	python-pytest-cov
	python-gevent
	python-pylibmc
	python-memcached
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('6fa634ad18b317cab0721427fc7ea6b7')
sha256sums=('8923ab59840f0d5338f1c52dba229fa835545b91c3c2f691c118e678d0fb974e')
sha512sums=('7089b3fdf424735a1922685022a30f7984686f13401a13101e4745ea1c38a3888b1c380f859653da85889e95829f3b7c6226c3c55f838baf783465321433fda5')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
}

check(){
	pushd $_pyname-$pkgver
	python -m pytest
	popd
}

_package_python(){
	depends=(
		python
		python-six
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
