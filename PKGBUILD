# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshplex
pkgname=python-${_base}
pkgdesc="Compute interesting points, areas, and volumes in simplex meshes of any dimension"
pkgver=0.16.5
pkgrel=2
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio python-npx)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks python-meshzoo python-matplotlib python-scipy)
optdepends=('python-matplotlib: for Matplotlib rendering'
	'vtk: for create polygonal sphere'
)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f706429aa7fcd68df45392476fa266698b41d64b9237fdae1fa54626038e6aa3b81db107eff850fb44c009155e13cf1f65c7299fe5ae2e5ac60bf780d785cf81')

build() {
	cd "${_base}-${pkgver}"
	export PYTHONHASHSEED=0
	python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks tests
# }

package() {
	cd "${_base}-${pkgver}"
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
