# Maintainer: Schmoho

pkgname=openproject-cli
_distname=openproject_cli
pkgver=0.1.0
pkgrel=4
pkgdesc="Command-line client for OpenProject API v3"
arch=('any')
url="https://github.com/decent-tools-for-thought/openproject-cli"
license=('0BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "$_distname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver.tar.gz"
)
sha256sums=(
  '489c0d4dbe085c8d27304eedcf5e71ac877e01ae0f5869846438c191be0f3967'
)

build() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
