# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='python-gql'
pkgver=3.5.0
pkgrel=1
pkgdesc="Python GraphQL client"
arch=('any')
provides=()
conflicts=()
url="https://github.com/graphql-python/gql"
license=('MIT')
depends=(
	'python-aiohttp'
	'python-anyio'
	'python-backoff'
	'python-graphql-core'
	'python-requests'
	'python-websockets'
	'python-yarl'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f96f8c8721a782d7dea0a3cd584c87ff53825a9fecc7c66ac9715788015b6009')

prepare() {
	cd "$srcdir"

	# Add python- at the start of the directory
	mv {${pkgname#python-},$pkgname}-$pkgver
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
