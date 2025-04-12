# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgname="python-${_name}"
pkgver=1.8.1
pkgrel=3
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages."
arch=("any")
url="http://cclib.github.io"
license=("BSD-3-Clause")
makedepends=("python-build"
             "python-installer"
             "python-setuptools"
             "python-versioningit"
             "python-wheel")
depends=("python-packaging"
         "python-periodictable"
         "python-scipy")
optdepends=('psi4: for Psi4 bridge'
            'python-ase: for ASE bridge'
            'python-biopython: for generating `BioPython.Atom`s of parsed results'
            'python-iodata: for reading proatom densities from horton'
            'python-openbabel: for generating `OBMol`s of results'
            'python-pandas: for generating DataFrames of parsed results'
            'python-pyquante2: for computing grid-based quantities with cube output'
            'python-pyscf: for PySCF bridge')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('d10aa2352479fcdaa86cc32055a8ae7f98ce26523ea928944ab2256f0875d605')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"

  # remove upper version restriction on versioningit
  sed -i "s/versioningit~=2.0/versioningit/" pyproject.toml
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# Requires many heavy dependencies
# check() {
#   cd "${srcdir}/${_name}"
#   /usr/bin/python -m pytest
# }
