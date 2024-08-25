# Maintainer: a821 at mail de
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao at gmail.com>

pkgname=python-pypinfo
_pkg="${pkgname#python-}"
pkgver=22.0.0
pkgrel=1
pkgdesc="View PyPI download statistics with ease"
arch=('any')
url="https://github.com/ofek/pypinfo"
license=('MIT')
depends=(
	'python-binary'
	'python-click'
	'python-google-cloud-bigquery'
	'python-packaging'
	'python-platformdirs'
	'python-tinydb'
	'python-tinyrecord')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
changelog='CHANGELOG.rst'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c31f21ecde1fb373a3ad9f7c7f46d1f43681de8052c5ba794cfe18c17ac12534')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md AUTHORS.rst CHANGELOG.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
