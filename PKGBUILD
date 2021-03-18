# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pypowervm
pkgname=python-$_pyname
pkgver=1.1.24
pkgrel=1
pkgdesc="Python binding for the PowerVM REST API"
arch=(any)
url="http://github.com/powervm/"
license=(Apache)
depends=(
	python
	python-pbr
	python-lxml
	python-oslo-concurrency
	python-oslo-context
	python-oslo-i18n
	python-oslo-log
	python-oslo-utils
	python-pyasn1-modules
	python-pyasn1
	python-pytz
	python-taskflow
	python-requests
	python-six
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-coverage
	python-discover
	python-fixtures
	python-pylint
	python-subunit
	python-sphinx
	python-oslosphinx
	python-stestr
	python-testscenarios
	python-testtools
	python-mock
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('50b580055e5628aadaeb42fd69158ff8')
sha256sums=('4c6bf225d2b1022b5d363f9b3695fd1692523235d3ce1b5b4506fbc608bdb535')
sha512sums=('b2d254555c7501961bd45ac7a7bfea886ac12c8eab07b6bc34352e425f6e9c9cb6fa8331796164962f1f60afcaa9aa9e8a711cdf71dcb70cce7c4188c4217543')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	## mkvterm and rmvterm is not available in archlinux
	rm -f pypowervm/tests/tasks/test_vterm.py
	unset LANGUAGE LANG LC_ALL
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
