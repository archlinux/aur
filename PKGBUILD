# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-meshplex
_name=meshplex
pkgver=0.16.2
pkgrel=1
pkgdesc="Compute interesting points, areas, and volumes in triangular and tetrahedral meshes."
arch=('any')
url="https://github.com/nschloe/meshplex"
license=('GPL')
optdepends=('python-matplotlib' 'python-vtk')
makedepends=('python'
	'python-setuptools' 'python-dephell')
depends=('python-meshio' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('db10eb1b5e02dc9c338467fb6c1d519baa4b3af76be16787610d527bb8756a6b')

prepare() {
	cd "$srcdir/$_name-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
