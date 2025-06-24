# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='python-gql'
pkgver=3.5.3
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
sha256sums=('121f41bb446f0346c6a9780bb24b03838ef0602aa60b64f4cb7505a3fbfb1ba1')

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
