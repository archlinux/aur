# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-asyncstdlib
_name=${pkgname#python-}
pkgver=3.12.3
pkgrel=1
pkgdesc="The missing toolbox for an async world"
arch=('any')
url="https://github.com/maxfischer2781/asyncstdlib"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d72541714c3e379ad411769d575c76269de5c37faa254c976fb177cdaab5d7dd')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
