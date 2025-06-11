# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-uuid6
_name=${pkgname#python-}
pkgver=2025.0.0
pkgrel=1
pkgdesc="New time-based UUID formats which are suited for use as a database key"
arch=('any')
url="https://github.com/oittaa/uuid6-python"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3b7e6a21faaedb1099c8cd43ff9eb3eea0effd6709f3495a9507a4cabe894f24')

build() {
  cd "$_name-python-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
