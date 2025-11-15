# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: kang <kang@insecure.ws>

pkgname=python-sphinxcontrib-newsfeed
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=17
pkgdesc="News Feed extension for Sphinx"
arch=(any)
url="https://github.com/prometheusresearch/sphinxcontrib-newsfeed"
license=(BSD-2-Clause)
depends=(
  python
  python-docutils
  python-sphinx
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('96d9d0c15fca8b62f945bafc8f0eafa62df9c471f7510e2f153e47b66534e5f3041e5c01df772e6c35a9f09baa70064642f7f0fa43ccfd33dd64c2604494f2fc')
b2sums=('708c7a725ac36f54ea735953ba9d230b05da95147eabc91de9d610d3e02ec7d0d1ab8f5882d4e97327da425fc49e1b1a1753e011445ede859edd4f3cd5fb2a16')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}
