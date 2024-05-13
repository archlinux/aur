# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=3.18.3
pkgrel=1
pkgdesc="fslpy is the python library collection used by FSL and related projects"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
# Keep python-deprecated to keep FEAT check of FSL FEEDS from failing
depends=('python' 'python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py' 'python-dill')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-rtree' 'python-pillow' 'python-indexed-gzip' 'python-trimesh')
provides=()
conflicts=()
replaces=()
source=(https://git.fmrib.ox.ac.uk/fsl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ea1edd91fe979d0fbe3db698caf31874bd3afc611ac796fe3e6c476ee243adf0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
