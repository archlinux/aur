# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgname=python-kaptan
pkgver=0.5.12
pkgrel=8
pkgdesc="Configuration manager in your pocket"
arch=(any)
url="https://github.com/emre/kaptan"
license=(BSD)
depends=(python-yaml)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('3626dbb8475a2492ebdd13e6dfb78efb35769e75bcc29b9afaadc9f41f681aba6a10338f8692ecab43b27e9f4b82fa937b5d2bd5a60079dc3df9ac6f26104fd8')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  PYTHONPATH=. pytest
}

package_python-kaptan() {
  cd $_name-$pkgver
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="$pkgdir"
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # docs
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname"
}
