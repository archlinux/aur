# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-v8
_pkgname=pyv8
pkgver=19632
pkgrel=2
pkgdesc="A Libemu Cython wrapper"
arch=('x86_64')
url="https://github.com/buffer/pyv8.git"
license=('GPL2')
depends=('python2' 'boost-libs')
makedepends=('git' 'v8')
source=("git+$url#commit=b5b0407" setup.diff)
sha256sums=('SKIP'
            'b11377849e06c7dde17162eee51659b1274d6528f77fab48f7af05e581b91a2d')
makedepends=('python2' 'python-setuptools')

prepare() {
  cd ${_pkgname}
  patch -Np1 < "$srcdir"/setup.diff
  sed -i '1s+python$+python2+' PyV8.py
}

package() {
  cd ${_pkgname}
  python2 setup.py install --root="$pkgdir"
  sed -i '1s+python$+python2+' "$pkgdir"/usr/lib/python2.7/site-packages/PyV8.py
}
