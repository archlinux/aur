# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=2.27.0
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
             python-installer
             python-scikit-build-core
             python-setuptools-scm)

source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af712adc484a32bae031e5a2754f5ffc89fb61e616eab08864f2a6f4454d81cc')

build() {
  cd "$srcdir"/phonopy-$pkgver
  python setup-legacy.py egg_info
  cp phonopy.egg-info/PKG-INFO ./
  python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/phonopy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}