# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-aiomeasures
_pkg="${pkgname#python-}"
pkgver=0.5.14
pkgrel=3
pkgdesc="Collect and send metrics to StatsD"
arch=('any')
url="https://github.com/cookkkie/aiomeasures"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bac7a3c176bee994148febcd2c24ea7f2986316e9e682c85c7a1db7f174be799')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
