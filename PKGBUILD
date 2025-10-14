# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-trackpy
_pkg="${pkgname#python-}"
pkgver=0.7
pkgrel=1
pkgdesc="Python particle tracking toolkit"
url="https://github.com/soft-matter/trackpy"
arch=('any')
license=('BSD')
depends=('python' 'python-numpy' 'python-pandas' 'python-scipy' 'python-looseversion' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools')
#checkdepends=('python-nose')
optdepends=("python-pims: simplifies image-reading"
            "python-pytables: saving results in an HDF5 file"
            "python-numba: for accelerated feature-finding and linking"
            "python-pillow: for some display routines")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('7c67af8d5242323f4469a3e0157146b42f82be9ae640c4bbff0a8a5888928818')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "$_pkg-$pkgver"
#	nosetests3
#}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
