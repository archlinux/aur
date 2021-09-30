# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-meshplex
_name=${pkgname#python-}
pkgver=0.16.5
pkgrel=1
pkgdesc='Compute interesting points, areas, and volumes in triangular and tetrahedral meshes.'
url='https://github.com/nschloe/meshplex'
arch=('any')
license=('GPL')
makedepends=(
	'python'
	'python-setuptools'
	'python-dephell'
)
depends=(
	'python-meshio'
	'python-numpy'
	'python-npx'
)
optdepends=(
	'python-matplotlib'
	'vtk'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('6e97a5164bc8cfb7bf410508aa92b2900671c5372fdf1b8a522042f84978b5d404190195a0ce864ef2270a9cfd2497a832a6e14effbf6ab71688f5d8c256c840')

prepare() {
	cd "$srcdir/$_name-$pkgver" || exit
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$srcdir/$_name-$pkgver" || exit
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
