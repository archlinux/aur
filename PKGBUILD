# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-earthpy
_pkg="${pkgname#python-}"
pkgver=0.9.4
pkgrel=1
pkgdesc='Package built to support working with spatial data'
arch=('any')
url="https://github.com/earthlab/earthpy"
license=('BSD')
depends=('python-geopandas' 'python-matplotlib' 'python-numpy' 'python-rasterio' 'python-scikit-image' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
changelog=
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('16ec2831ec87ace9d70473ef23840b6bf3cd239e178b9ddb5767da86e5a34c1b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
