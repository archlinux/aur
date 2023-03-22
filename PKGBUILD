# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=python-nanoid
_pkg=py-nanoid
pkgdesc="A tiny, secure, URL-friendly, unique string ID generator for Python"
pkgver=2.0.0
pkgrel=2
_commit='99e5b478c450f42d713b6111175886dccf16f156'
arch=('any')
url="https://github.com/puyuan/py-nanoid"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('875d3ddbb00359e408110b0e2ee98183ccdd942d6277576b4b528f02d3279cf5')

build() {
	cd "$_pkg-$_commit"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$_commit"
	pytest -x
}

package() {
	cd "$_pkg-$_commit"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/nanoid-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
