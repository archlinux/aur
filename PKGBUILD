# Maintainer: Marco Gulino <marco dot gulino at gmail dot com>
pkgname=python-xisf
_name=${pkgname#python-}
pkgver=0.9.5
pkgrel=2
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
sha256sums=('343d0b3d1cca575808eaeefec19ffec53986b57f11757a9feb833dc4f79bd645')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
