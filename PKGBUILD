# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-process
pkgver=0.11.1
pkgrel=1
pkgdesc='Modeling and simulation framework for biotech processes – high-level python frontend'
arch=(any)
url='https://cadet-process.readthedocs.io/en/latest/'
license=(GPL-3.0-only)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/fau-advanced-separations/$pkgname#tag=v$pkgver")
sha256sums=('6a4052e2f0b880535c8fe700ae7b68e4fc04883bd8a8e7c8c77f398a58cf83ef')

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
