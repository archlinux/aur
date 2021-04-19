# Maintainer: Daniel Scheiermann  <daniel.scheiermann@stud.uni-hannover.de>
_name=supersolids
pkgname=python-${_name}
pkgver=0.1.31
pkgrel=1
pkgdesc="Simulate and animate supersolids by solving the Schrödinger equation"
url="https://github.com/Scheiermann/${_name}"
arch=(any)
license=("MIT")
depends=("ffmpeg" "python-dill" "python-ffmpeg" "python-matplotlib" "python-numpy"
         "python-pyqt5" "python-scipy" "python-sphinx-autoapi" "python-sphinx_rtd_theme"
         "mayavi"
         )
makedepends=("python-setuptools")
optdepends=("")
source=(${_name}-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py build
}

check_disabled() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  # alternatively install dependencies with pip
  # for python3.8
  # python -m pip install -U autoapi ffmpeg-python numpy matplotlib mayavi psutil scipy sphinx-rtd-theme
  # for python3.9 (to install mayavi, vtk is needed)
  # (watch out: currently there is no vtk wheel for python3.9, so you need to build it from source
  #  or take an unofficial build (provided by the project creator of this package), then install mayavi)
  # python -m pip install -U autoapi ffmpeg-python numpy matplotlib mayavi psutil scipy sphinx-rtd-theme 
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

}
