# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='python-gql'
pkgver=3.0.0a5
pkgrel=1
pkgdesc="Python GraphQL client"
arch=('any')
provides=()
conflicts=()
url="https://github.com/graphql-python/gql"
license=('MIT')
depends=(
	'python-aiohttp'
	'python-graphql-core'
	'python-requests'
	'python-websockets'
	'python-yarl'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fa85697d5d4f1d1eddbf470573082c77a0db1082ef15f51951c05e5becd0a0d0')

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
