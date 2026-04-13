# Maintainer: Luke Labrie-Cleary <luke.cleary@copenhagenatomics.com>
pkgname=python-cad_to_openmc-git
pkgver=1.0.1.r184.g6df6494
pkgrel=1
pkgdesc="code to target the conversion from a step-file to a h5m-geometry 
		     for neutronics"
arch=('any')
url="https://github.com/united-neux/CAD_to_OpenMC"
license=('MIT')
depends=(
  python
  python-gmsh-bin
  python-pyparsing
  python-numpy
  python-networkx
  python-unidecode
  hdf5-openmpi
  python-multimethod
  python-typish
  python-ezdxf
  python-nptyping
  python-pymoab
  moab-git
  nlopt
  python-cadquery
)

makedepends=(
  git
  python-build
  python-installer
  python-wheel
  cython
)

_name="CAD_to_OpenMC"
provides=("${_name%-pkgver}")
source=("git+https://github.com/united-neux/CAD_to_OpenMC.git")
md5sums=('SKIP')
conflicts=('python-cad_to_openmc')

pkgver() {
  cd "$srcdir/${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_name}"
    python \
      -m build \
      --wheel \
      --no-isolation
  }

package() {
    cd "$srcdir/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # make git repo available in opt 
    cd "$srcdir"
    mkdir $pkgdir/opt
    cp -r "$_name" $pkgdir/opt
}

