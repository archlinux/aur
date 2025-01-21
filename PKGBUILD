# Maintainer: Danct12 <danct12@disroot.org>

pkgname=python-gbinder
pkgver=1.1.2
pkgrel=3
pkgdesc="Python bindings for libgbinder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/erfanoabdi/gbinder-python"
license=('GPL')
depends=('libgbinder')
makedepends=('git' 'python-setuptools' 'cython')
_commit="a2c5093c734e59df9f592010020cf081dadce81f"
source=(${pkgname}::git+https://github.com/erfanoabdi/gbinder-python.git#commit=${_commit}
  pr12.patch)
sha512sums=('e12a0ed62bbf0d70a0ca53ea2d50a173a3b4cfe964ac92d5c591225f727ee4ab6ed591c2a6d35d5e95fc9dae04216c84303427b121a1d60d377225d99625439f'
            'd8509b4c01fffcb002ab84cd170881d5df0dc5b990e0ae562b887abb6176530c087ca4151358466d7e1cb491accf662b2b44d2dc2e05effc6d9f01eb4003bfcc')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ${pkgname}
  patch -p1 -i "$srcdir/pr12.patch"
}

build() {
  cd ${pkgname}
  python3 setup.py build --cython
}

package() {
  cd ${pkgname}
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}
