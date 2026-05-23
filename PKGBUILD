# Maintainer: Repeater <fakeroration@gmail.com>
pkgname=python-typst
_pkgname=${pkgname#python-}
pkgver=0.14.9
pkgrel=1
pkgdesc="Python binding to typst"
arch=('x86_64')
url="https://github.com/messense/typst-py"
license=('Apache-2.0')
depends=('python' 'python-maturin>=1.0' 'maturin>=1.0' 'openssl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e33f0095824d4e96edb2f698e40974cd83bf7f25ef5e137754b2ec533d79cae9')

build() {
  cd "$srcdir/$_pkgname-py-$pkgver"

  OPENSSL_NO_VENDOR=1 python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-py-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
