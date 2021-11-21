# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pycapnp
pkgver=1.1.0
pkgrel=3
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=('BSD')
arch=('x86_64')
depends=('capnproto' 'python')
makedepends=('cython' 'python-pkgconfig' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/capnproto/pycapnp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1013b49f860a2b65e5850bf9435a23bc5171ce8648c4c671212f206bb2718f97cadf791c1829ec4bacb2cd26dc380a4a61a1f8cabe4ae8b064f73158b16389b2')

build() {
  cd pycapnp-$pkgver
  python setup.py build
}

check() {
  cd pycapnp-$pkgver
  PYTHONPATH="build/lib.linux-$CARCH-3.9" pytest
}

package() {
  cd pycapnp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
