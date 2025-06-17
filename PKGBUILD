# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=reclaimed
pkgver=0.2.6
pkgrel=2
pkgdesc="disk space utilization & cleanup application (python tui)"
arch=('any')
url='https://github.com/taylorwilsdon/reclaimed'
license=(MIT)
depends=(python python-click python-rich python-psutil python-textual)
checkdepends=(python-pytest)
makedepends=(
  python-build
  python-setuptools
  python-installer
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/taylorwilsdon/reclaimed/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('33c98dadd37d22ce10f05764343dab58b513f781968b44fb39768cce47936289')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  PYTHONPATH="$PWD" python -m pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/${pkgname/-/_}-*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
