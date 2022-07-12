# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=python-diffractio
_pkg="${pkgname#python-}"
pkgver=0.0.13
pkgrel=2
pkgdesc='Optical Diffraction and Interference'
arch=('any')
url="https://bitbucket.org/optbrea/diffractio"
license=('MIT')
depends=(
	'python-numpy' 'python-scipy' 'python-matplotlib' 'python-screeninfo' 'python-pillow'
	'python-numexpr' 'python-pandas' 'python-py-pol' 'python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest-runner' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('5bfb2fa72a185aaab19c7d9b1f37a6f4617e28206bb6d6532c3fe399593e7fea')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
