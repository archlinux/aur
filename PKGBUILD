# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.30.1
pkgrel=2
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

source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ebd9bf949c16f1e1771ab7bbfbea21267cdd1c7500f5259e76ecb91d3b0529cd')

build() {
  cd "$srcdir"/phonopy-$pkgver
  python setup-legacy.py egg_info
  cp phonopy.egg-info/PKG-INFO ./
  python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/phonopy-$pkgver
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}