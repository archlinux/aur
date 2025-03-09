# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-asyncstdlib
_name=${pkgname#python-}
pkgver=3.13.1
pkgrel=1
pkgdesc="The missing toolbox for an async world"
arch=('any')
url="https://github.com/maxfischer2781/asyncstdlib"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8d4bdf36daa4ed4571d94dfa73d3e510824ba610448077e20e02467e787b5be')

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
