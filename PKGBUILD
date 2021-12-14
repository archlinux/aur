# Maintainer: fkobayashi <see name left ＠ 数学 (but in english) dot ubc.ca
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-lapsolver
_pyname=${pkgname#python-}
pkgver=1.1.0
pkgrel=3
pkgdesc='Fast linear assignment problem solvers'
arch=(any)
url="https://github.com/cheind/py-$_pyname"
license=(MIT)
depends=(python)
makedepends=(cmake
             python-setuptools)
checkdepends=(python-numpy
              python-pytest-runner)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('e438689e528f18b801d996f10d158554050618a89ffff6b562a97ba41cfd37ed')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
