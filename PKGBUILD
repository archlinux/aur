# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgbase=python-nnpy
pkgname=('python-nnpy' 'python2-nnpy')
pkgver=1.4.2
pkgrel=1
pkgdesc='nanomsg bindings for Python'
arch=('x86_64')
url='https://pypi.org/project/nnpy/'
license=('MIT')
makedepends=('nanomsg' 'python-cffi' 'python-setuptools' 'python2-cffi' 'python2-setuptools')
source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/nanomsg/nnpy/archive/${pkgver}.tar.gz"
)
sha256sums=(
  'fcfc4115429cae1872a51abe94bb01e2de6d851c5ce82d415d85f0e60a128549'
)

prepare() {
  cp -a nnpy-$pkgver{,-py2}
  find nnpy-$pkgver-py2 -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd "$srcdir"/nnpy-$pkgver
  python setup.py build

  cd "$srcdir"/nnpy-$pkgver-py2
  python2 setup.py build
}

package_python-nnpy() {
  depends=('nanomsg' 'python-cffi')

  cd nnpy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-nnpy() {
  depends=('nanomsg' 'python2-cffi')

  cd nnpy-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
