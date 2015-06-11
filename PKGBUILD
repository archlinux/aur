# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-msgpack-numpy-git
pkgver=0.3.2.r15.gd6603cd
_gitname=msgpack-numpy
pkgrel=2
pkgdesc='Python 3 package that provides encoding and decoding routines that enable the serialization and deserialization of numerical and array data types provided by numpy using the highly efficient msgpack format.'
arch=('any')
url='https://github.com/lebedov/msgpack-numpy'
license=('BSD')
depends=('python'
         'python-numpy'
         'python-msgpack')
source=('git+https://github.com/lebedov/msgpack-numpy')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-msgpack-numpy')
conflicts=('python-msgpack-numpy')

pkgver() {
  cd "$_gitname"
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

# vim:set ts=2 sw=2 et:
