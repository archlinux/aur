# Maintainer: zhullyb <zhullyb@outlook.com>

_pyname=taskflow
pkgname=python-$_pyname
pkgver=4.6.2
pkgrel=1
pkgdesc="Taskflow structured state management library."
arch=(any)
url="https://docs.openstack.org/taskflow/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-six
	python-futurist
	python-fasteners
	python-networkx
	python-stevedore
	python-jsonschema
	python-automaton
	python-oslo-utils
	python-oslo-serialization
	python-tenacity
	python-cachetools
	python-pydot
)
makedepends=(
	python
)
checkdepends=(
	python-kazoo
	python-zake
	python-redis
	python-kombu
	python-eventlet
	python-sqlalchemy
	python-alembic
	python-sqlalchemy-utils
	python-pymysql
	python-psycopg2
	python-pydotplus
	python-hacking
	python-oslotest
	python-mock
	python-testtools
	python-testscenarios
	python-stestr
	python-pre-commit
)
optdepends=(
	python-kazoo
	python-zake
	python-redis
	python-kombu
	python-eventlet
	python-sqlalchemy
	python-alembic
	python-sqlalchemy-utils
	python-pymysql
	python-psycopg2
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('27ea693e859ccf5f7730ff082e2fa687')
sha256sums=('84b549ca8eb2f4b1cceac99944382824690b110dd9dac5653b738f9aa5e7e3ba')
sha512sums=('4d674bce5e7f394e812fe9d68687b8f9525ade03dfa79a5573bccab1b4d51eed3a438802712b0377cdd81f848f55a36d39bab3d2b60652ad6bf20b1715a0af12')

export PBR_VERSION=$pkgver

build(){
	pushd $_pyname-$pkgver
	python setup.py build
}

## Test broken
#check(){
#	pushd $_pyname-$pkgver
#	stestr run
#}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
