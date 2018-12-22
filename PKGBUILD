# Maintainer: DanManN <dnahimov@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
pkgname=python-msgpack-numpy-git
pkgver=0.4.4.2.r95.ff6901d
_gitname=msgpack-numpy
pkgrel=4
pkgdesc="Python 3 package that provides encoding and decoding routines that enable the serialization and deserialization of numerical and array data types provided by numpy using the highly efficient msgpack format."
arch=('any')
url='https://github.com/lebedov/msgpack-numpy'
license=('BSD')
depends=('python'
         'python-numpy'
         'python-msgpack')
source=('git+https://github.com/lebedov/msgpack-numpy.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-msgpack-numpy')
conflicts=('python-msgpack-numpy')

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.%s" "$(cat setup.py | grep -i version | cut -d "'" -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${_gitname}
  python setup.py test --verbose
}

build() {
  cd ${_gitname}
  python setup.py build
}

package() {
  cd ${_gitname}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}
