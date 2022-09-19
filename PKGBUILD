# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pypowervm
pkgname=python-$_pyname
pkgver=1.1.27
pkgrel=1
pkgdesc="Python binding for the PowerVM REST API"
arch=(any)
url="http://github.com/powervm/"
license=(Apache)
depends=(
	python
	python-pbr
	python-babel
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
md5sums=('4a16d0f483ec153dfd696146bfd8f9c1')
sha256sums=('d792d8a6390c25b742142f39d201f6b416b44b960434fd42a0241b2489e258c4')
sha512sums=('8397ae8418965ee296939adfd6e23c2144fdd69deab5990da0fecd8ed5bd9c31d7e4c08d7fbe5d434056158c9db46b4cfa53b2fc0ef2efe56a5ead08c0a8c187')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	## mkvterm and rmvterm is not available in archlinux
	rm -f pypowervm/tests/tasks/test_vterm.py
	LANGUAGE=C LANG=C LC_ALL=C stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
