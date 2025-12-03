# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='python-gql'
pkgver=4.0.0
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
sha256sums=('5aae3dbae14d4b9963569c37adf3e99a90f82bfe7a9b8fe5208ae5db96f88d76')

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
