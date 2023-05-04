# Maintainer: a821
# Contributor: DanManN <dnahimov@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
pkgname=python-msgpack-numpy-git
pkgver=0.4.8.r0.gfd7032a
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
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-msgpack-numpy')
conflicts=('python-msgpack-numpy')

pkgver() {
  cd ${_gitname}
  git describe --tags --long | sed 's/-/.r/;s/-/./'
}

check() {
  cd ${_gitname}
  python -m unittest -v
}

build() {
  cd ${_gitname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_gitname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
