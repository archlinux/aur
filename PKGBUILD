# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien "Seblu" Luttringer

pkgname=python2-msgpack
pkgver=0.6.2
pkgrel=4
pkgdesc='MessagePack serializer implementation for Python'


url='https://github.com/msgpack/msgpack-python'
arch=('x86_64')
license=('Apache')

depends=('python2')
makedepends=('cython2' 'python2-setuptools')
checkdepends=('python2-pytest' 'python2-six')

source=(msgpack-python-$pkgver.tar.gz::https://github.com/msgpack/msgpack-python/archive/v$pkgver.tar.gz)

sha512sums=('be4a65592acf3c2a4fcd5d6c603f5a3346f0bccb4864d82a729d47308a11d990f7137e66a9d6df7309a892d189f62e8a9efbda022b7ef2a09338012aa1634b6d')

build() {
  cd msgpack-python-$pkgver
  python2 setup.py build --build-lib=build/python
}

check() {
  cd msgpack-python-$pkgver
  PYTHONPATH=$PWD/build/python py.test2 test
}

package() {
  cd msgpack-python-$pkgver
  python2 setup.py build --build-lib=build/python \
                  install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
