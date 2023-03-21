# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-asyncstdlib
_name=${pkgname#python-}
pkgver=3.10.6
pkgrel=1
pkgdesc="The missing toolbox for an async world"
arch=('any')
url="https://github.com/maxfischer2781/asyncstdlib"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc867827d6d41c03212323f78acdd2c5ee50ff7d2631e53195286e944f6a9cd1')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
