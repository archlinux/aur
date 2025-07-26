# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=reclaimed
pkgver=0.2.9
pkgrel=1
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
sha256sums=('0fb12a2cdfb53a9c5986a522ece9e33b3ceede49a53aa8d07b2794cfc12aa8a3')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  #local pytest_args=(
  #  --deselect=tests/test_core/test_scanner.py::test_save_results
  #)
  cd $pkgname-$pkgver
  PYTHONPATH="$PWD" python -m pytest # "${pytest_args[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/${pkgname/-/_}-*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
