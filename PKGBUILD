# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pycapnp
pkgver=1.0.0
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=('BSD')
arch=('x86_64')
depends=('capnproto' 'python')
makedepends=('cython' 'python-pkgconfig' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/capnproto/pycapnp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('19b1502cddb4a4a33bffaba36c83808537a66d6e8b4e59a1f9c387aa4833e98c559d414387929e30dab9ba65c9436a1ad4df175e3993947a969e25504bac6c61')

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
