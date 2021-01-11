# Maintainer: DanManN <dnahimov@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
pkgname=python-msgpack-numpy-git
pkgver=0.4.7.1.r0.g963db59
_gitname=msgpack-numpy
pkgrel=1
pkgdesc="Serialize numpy arrays using msgpack"
arch=('any')
url='https://github.com/lebedov/msgpack-numpy'
license=('BSD')
depends=('python-numpy'
         'python-msgpack')
source=('git+https://github.com/lebedov/msgpack-numpy.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-msgpack-numpy')
conflicts=('python-msgpack-numpy')

pkgver() {
  cd ${_gitname}
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

check() {
  cd ${_gitname}
  python setup.py test
}

build() {
  cd ${_gitname}
  python setup.py build
}

package() {
  cd ${_gitname}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
