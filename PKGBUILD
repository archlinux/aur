# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pypowervm
pkgname=python-$_pyname
pkgver=1.1.26
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
md5sums=('e4e33d88e9b8fd9557d7f4ffb91fb940')
sha256sums=('7362c474389960cc15e8579683fee60773cacf2ea2f24456e181ddfb117dfee0')
sha512sums=('c258a5d7b9a38f0e718d28ec07efe08b1bb7fae3086e3c2d0edc56c9cb0e7d8256fd6e8f1c17fe0511b4ce1772b935680b657fe565454bdb3c312a470c490a5d')

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
