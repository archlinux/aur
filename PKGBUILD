# Maintainer: zhullyb <zhullyb@outlook.com>

_pyname=taskflow
pkgname=python-$_pyname
pkgver=4.6.1
pkgrel=2
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
md5sums=('15f5bd3206151c0340fb52b01ec47f51')
sha256sums=('96f114b7d190529860110f4252fb171fa1cb67c74671069bafe08c3aae4362cc')
sha512sums=('a098b272125e32ae186430398cb42dc3bccf5974eb3cefdc8fb34df17a4083d6e06d47e1606d690ea48c5335504352acc0a795d892403ca7fd755bcca6df7a04')

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
