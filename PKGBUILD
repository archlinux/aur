# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=python-tesserocr
_name=${pkgname#python-}
pkgver=2.6.3
pkgrel=1
pkgdesc="A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython"
arch=('x86_64')
url="https://github.com/sirfz/tesserocr"
license=('MIT')
depends=('python' 'leptonica' 'tesseract')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68fec7233e741bad09f94365c68bfc79355aecc3fdd7360519204f9975f8b005')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
