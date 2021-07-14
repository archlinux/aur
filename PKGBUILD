# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-meshplex
_name=meshplex
pkgver=0.16.3
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
b2sums=('d2760c1acf9676a9c55a54b7eb2dd7813c70cb2a5af413be86922527e405239d9d072e939db7fbbf0099a63ef03bcbd10ab19c7bcc8681e302a817d70a3969f0')

prepare() {
	cd "$srcdir/$_name-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
