# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-process
pkgver=0.10.1
pkgrel=1
pkgdesc='Modeling and simulation framework for biotech processes – high-level python frontend'
arch=(any)
url='https://cadet-process.readthedocs.io/en/latest/'
license=(GPL-3.0-only)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/fau-advanced-separations/$pkgname#tag=v$pkgver")
sha256sums=('09a8a6a4eb5192b5d7c7968545f7a6271a5b921d3551bb7ca1d615648d082426')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  depends+=(cadet-core python-corner python-dill python-matplotlib python-numpy python-pandas
            python-pathos python-psutil python-pytest python-scipy)
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
