# Maintainer: Marco Gulino <marco dot gulino at gmail dot com>
pkgname=python-xisf
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python library for encoding and decoding Pixinsight XISF files"
arch=('any')
url="https://github.com/sergio-dr/xisf"
license=('GPL3')
depends=(
  'python'
  'python-lz4'
  'python-zstandard'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d531aade626ea0f703f8d69ca5ae65662af043e9a3e5f3c2d38cf37e596e2b53')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

