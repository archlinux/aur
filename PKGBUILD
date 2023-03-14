# Maintainer: Luke Labrie-Cleary <luke.cleary@copenhagenatomics.com>
pkgname=python-cad_to_openmc
pkgver=0.2.2.r121.g70562a6
pkgrel=1
pkgdesc="code to target the conversion from a step-file to a h5m-geometry 
		     for neutronics"
arch=('x86_64')
url="https://github.com/openmsr/CAD_to_OpenMC"
license=('MIT')
depends=(
   python
   python-pip
)

makedepends=(
	git
	python
	python-build
	python-installer
	python-wheel
)

_name="CAD_to_OpenMC"
provides=("${_name%-pkgver}")
source=("git+https://github.com/openmsr/CAD_to_OpenMC.git")
md5sums=('SKIP')

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
    pip install -r requirements.txt
    cd "$srcdir"
    cd .. 
    mv CAD_to_OpenMC $pkgdir/opt
}

