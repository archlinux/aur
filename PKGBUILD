# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-landlock
_name=${pkgname#python-}
pkgver=1.0.0.dev4
pkgrel=1
pkgdesc="Python interface to the Landlock Linux Security Module"
arch=('any')
url="https://github.com/Edward-Knight/landlock"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-pytest-forked')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ad39bafdd94a6210719e030f349076155148e5406a0dd7ef326728697752547')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
