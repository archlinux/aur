# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.33.3
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://github.com/phonopy/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "spglib" "python-h5py")
optdepends=("python-seekpath")
makedepends=(python
             nanobind
             python-build
             python-pip
             python-scikit-build-core
             python-setuptools-scm)

source=("https://files.pythonhosted.org/packages/bc/05/d5febb69dfdcaf29de1256657fb43a0b5669c6e4da39460ec497f7a0fb3e/phonopy-$pkgver.tar.gz")
sha256sums=('f3d3341631ae816daa9809ccceedf0e836c5b7aa59d756d7596df72d0d27e197')

build() {
  cd "$srcdir"/phonopy-$pkgver
  python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/phonopy-$pkgver
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}