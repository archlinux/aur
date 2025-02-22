# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-python
pkgver=1.0.4
pkgrel=1
pkgdesc='Modeling and simulation framework for biotech processes – low-level python frontend'
arch=(any)
url='https://cadet.github.io/master/developer_guide/cadet_python.html'
license=(BSD-3-Clause)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/cadet/$pkgname#tag=v$pkgver")
sha256sums=('45965880d86cf54f7bfa42719fbe2d27bd66103a96ea9b24254b4ce9e79abe5b')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  depends+=(cadet-core python-addict python-filelock python-h5py python-numpy)
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
