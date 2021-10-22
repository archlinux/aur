# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshplex
pkgname=python-${_base}
pkgdesc="Compute interesting points, areas, and volumes in simplex meshes of any dimension"
pkgver=0.16.6
pkgrel=1
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
sha512sums=('f6b0e5a59d3f410dfb730cead5b3af5b9edec6c6926d1b3a61a77a166e7c9164de8f4a69921f85aaa67705856e448b515521d4510dc252cd42ebe31716c6c9ce')

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
