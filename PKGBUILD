# Maintainer: Daniel Scheiermann  <daniel.scheiermann@stud.uni-hannover.de>
_name=supersolids
pkgname=python-${_name}
pkgver=0.1.33
pkgrel=1
pkgdesc="Simulate and animate supersolids by solving the Schrödinger equation"
url="https://github.com/Scheiermann/${_name}"
arch=(any)
license=("MIT")
depends=("ffmpeg" "python-dill" "python-ffmpeg" "python-matplotlib" "python-numpy" "python-psutil"
         "python-pyqt5" "python-scipy" "python-sphinx-autoapi" "python-sphinx_rtd_theme"
         )
makedepends=("python-setuptools")
optdepends=("")
source=(${_name}-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=('01d7068678a577fcf6b8b4a5785a00333128ad22d9e4596c3dd3c1eba7103e7e')

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
  # install mayavi, vtk is needed
  python -m pip install -U vtk
  python -m pip install -U mayavi
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

}
