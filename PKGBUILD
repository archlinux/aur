# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.43.2
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://github.com/phonopy/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "spglib" "python-h5py")
optdepends=("python-seekpath" "python-symfc")
makedepends=(python
             nanobind
             python-build
             python-pip
             python-scikit-build-core
             python-setuptools-scm)

source=("git+https://github.com/phonopy/phonopy.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/phonopy
  rm -rf dist
  python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/phonopy
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}
