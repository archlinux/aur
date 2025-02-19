# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=autoremove-torrents-hnr
_pkgname="${pkgname//-/_}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Automatically remove torrents according to your strategies (H&R version)"
arch=(any)
url="https://pypi.org/project/autoremove-torrents-hnr"
license=('MIT')
provides=('autoremove-torrents')
conflicts=('autoremove-torrents')
depends=(
	'python-deluge-client'
	'python-ply'
	'python-psutil'
	'python-yaml'
	'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${_pkgname}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('9ead2b7b0bb50188fcf8f9514091965082d7f26c31e2ef18643be7ef9d4a2b2b')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

# skip check because PyPI source doesn't include test files

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
