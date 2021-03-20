# Maintainer: zhullyb <zhullyb@outlook.com>

_pyname=taskflow
pkgname=python-$_pyname
pkgver=4.6.0
pkgrel=1
pkgdesc="Taskflow structured state management library."
arch=(any)
url="https://opendev.org/openstack/castellan"
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
md5sums=('32a69d31715d9a9a7526f2637fa89e46')
sha256sums=('0333a721808c938fd083fecc5928b43be5fd4f96617e946779bfe75c6269f617')
sha512sums=('236571f8a99a19b1a03eec72acd0ec102b367b7889e4aac207b38a623cb048a67ef72abaa62ed2fa873427eadd50d2c711246064c6abbc0e6029134fd629c932')

export PBR_VERSION=$pkgver

build(){
	pushd $_pyname-$pkgver
	python setup.py build
}

check(){
	pushd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
