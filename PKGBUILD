# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien "Seblu" Luttringer

pkgname=python38-msgpack
pkgver=1.0.4
pkgrel=1
pkgdesc='MessagePack serializer implementation for Python'

url='https://github.com/msgpack/msgpack-python'
arch=('x86_64')
license=('Apache')


depends=('python38')
makedepends=('cython' 'python38-setuptools')
checkdepends=('python38-pytest' 'python38-six')

source=(msgpack-python-$pkgver.tar.gz::https://github.com/msgpack/msgpack-python/archive/v$pkgver.tar.gz)

sha512sums=('206351b8b1f8070c601849b728ea63ced4fec91732856f69f88e3c05c769bcd0d868fe94d7549c8c100b82e9d732379c133bf8f438632647ff2e7812f936783d')

build() {
  cd msgpack-python-$pkgver
  python3.8 setup.py build
}

check() {
  cd msgpack-python-$pkgver
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=$(printf '%s\n' $PWD/build/* | paste -sd:) py.test test
}

package() {
  cd msgpack-python-$pkgver
  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
