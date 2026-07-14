# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-python
pkgver=1.3.0
pkgrel=1
pkgdesc='Modeling and simulation framework for biotech processes – low-level python frontend'
arch=(any)
url='https://cadet.github.io/master/developer_guide/cadet_python.html'
license=(BSD-3-Clause)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
source=("git+https://github.com/cadet/$pkgname#tag=v$pkgver")
sha256sums=('24f04fff06b3ff9d6d69b00e0d8bedbcfbca99ba403ef19f2de0f22ce356282b')

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
