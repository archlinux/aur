# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=python-tesserocr
_name=${pkgname#python-}
pkgver=2.5.2
pkgrel=4
pkgdesc="A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython"
arch=('x86_64')
url="https://github.com/sirfz/tesserocr"
license=('MIT')
depends=('python' 'leptonica' 'tesseract')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9371dd3f6fe3238039c73bfe15bcaf21389f7e75f62bd530a30110149f39b2ae')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
