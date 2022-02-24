# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover_plugins_manager
pkgdesc="Plugins manager for Plover."
pkgver=0.7.0
pkgrel=4
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
url="https://github.com/benoit-pierre/plover_plugins_manager"
_pkgdist="$pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoit-pierre/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fe762c2d3ab2e9e026ee6f0cffe4987ce1d794196a27df81487113bef62754b5')

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
