# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=colorio
pkgname=python-${_base}
pkgdesc="Tools for color models"
pkgver=0.8.4
pkgrel=3
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=('GPL3')
depends=('python-matplotlib' 'python-npx')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-codeblocks' 'python-perfplot' 'gmsh' 'python-colorspacious' 'python-colour-science' 'python-pyvista' 'python-optimesh')
optdepends=('python-meshio: for creation mesh'
  'python-meshzoo: for creation triangle and cube mesh'
  'python-optimesh: for triangular mesh optimization'
  'python-pygmsh: for xy gamut mesh support'
  'python-pyvista: for creation unstructured grid and plotter'
  'python-scipy: for curve fit support'
  'vtk: for create VTK hexahedron support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('af5c142c4b61a336f4c5da444fc0b33539d62fad3fea70ac3435ed74b83ed7153901ed06aa9193875b640276c5378735c1d905d89f8cbd6fe0b2f7dfd6e49ce4')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):/usr/share/gmsh/api/python:${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
