pkgname=('phono3py')
pkgver=3.22.0
pkgrel=1
pkgdesc="A simulation package of phonon-phonon interaction related properties"
arch=('any')
url="https://github.com/phonopy/phono3py"
license=('BSD')
depends=(
    "python-phonopy>=2.46.0"
    "python-phonopy<2.47"
    "python-scipy"
    "python-matplotlib"
)
optdepends=(
    "openmpi"
)
makedepends=(
    "python"
)

source=("git+https://github.com/phonopy/phono3py.git#tag=v${pkgver}")
sha256sums=('SKIP')




build() {
  cd "$srcdir"/phono3py
  rm -rf dist


  python -m venv _buildenv
  _buildenv/bin/pip install --upgrade pip
  _buildenv/bin/pip install \
    numpy \
    scikit-build-core \
    "nanobind<2.10.0" \
    setuptools-scm \
    build

  _buildenv/bin/python -m build --wheel --no-isolation
}



package() {
  cd "$srcdir"/phono3py
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}
