# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=ripple-proton
_name=ripple
pkgver=3.2.0
pkgrel=1
pkgdesc='Download and install Proton releases with centralized storage and symlink management'
arch=('any')
url='https://github.com/sachesi/ripple'
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('ripple')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('6228f7c4da1d88f950017f47e44f84482e79a598281172ce69e17d710c45cbda')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=src python -m unittest discover -s tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
