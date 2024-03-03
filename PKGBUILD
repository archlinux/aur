# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-asyncstdlib
_name=${pkgname#python-}
pkgver=3.12.1
pkgrel=1
pkgdesc="The missing toolbox for an async world"
arch=('any')
url="https://github.com/maxfischer2781/asyncstdlib"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32c92658380dc1495909f2c02cd1ef3128310ddb9b6623206e0efe477cb83ba4')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
