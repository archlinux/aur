# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=perf_baseline
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="A performance regression detection tool for Python projects"
arch=('any')
url="https://github.com/rayluo/perf_baseline"
license=('MIT')
depends=('python')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('75a33395eb6c265c4fb30737d581a8fc47e53f08e11865fae3315c7db1633067')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
