# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=python-activipy-git
_pkgname=activipy
pkgver=v0.1.r16.g270bab2
pkgrel=1
pkgdesc='ActivityStreams 2.0 python implementation and validation lib'
arch=('any')
url='http://activipy.readthedocs.io/en/latest/index.html'
license=('GPL3')
depends=('python-pyld')
makedepends=('git')
conflicts=('python-activipy')
provides=('python-activipy')
source=('git://github.com/w3c-social/activipy.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 gpl-3.0.txt ${pkgdir}/usr/share/licenses/python-activipy
}
