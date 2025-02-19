# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=autoremove-torrents
pkgver=1.5.5
pkgrel=1
pkgdesc="Automatically remove torrents according to your strategies"
arch=(any)
url="https://github.com/jerrymakesjelly/autoremove-torrents"
license=('MIT')
depends=(
	'python-deluge-client'
	'python-ply'
	'python-psutil'
	'python-yaml'
	'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jerrymakesjelly/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1c77db84073b3acfb850f25b2b47ec4d4119f55aa52fdc51d262a18d3b45f435')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	pytest --ignore pytest/test_clients
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
