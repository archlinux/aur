# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover_plugins_manager
pkgdesc="Plugins manager for Plover."
pkgver=0.7.2
pkgrel=1
arch=('any')
license=('GPL2')
depends=(
  plover-git
  python
  python-cmarkgfm
  python-pip
  python-pkginfo
  python-pygments
  python-pyqt5
  python-readme-renderer
  python-requests
  python-requests-cache 
  python-requests-futures
  python-setuptools
  python-wheel
  qt5-svg
)
makedepends=(
  'python-build'
  'python-installer'
)
url="https://github.com/openstenoproject/plover_plugins_manager"
_pkgdist="$pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstenoproject/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cf827c31fb2d907f1927cdd1858fb45a0a8cf4be530f65332f8f61c455f7ea57')

build() {
  cd "$_pkgdist"
  pyproject-build --no-isolation --skip-dependency-check --wheel
}

package() {
  cd "$_pkgdist"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
