# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=python-tesserocr
_name=${pkgname#python-}
pkgver=2.6.2
pkgrel=1
pkgdesc="A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython"
arch=('x86_64')
url="https://github.com/sirfz/tesserocr"
license=('MIT')
depends=('python' 'leptonica' 'tesseract')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4696a19f69bc5a1f07f0d0309c0e085dfe2af5cd01f86aee2d9cd1ddca42f603')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
