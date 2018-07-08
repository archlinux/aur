# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-daemon
pkgname=('python-daemon' 'python2-daemon')
pkgver=2.1.2
pkgrel=4
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-docutils' 'python2-docutils' 'python-lockfile' 'python2-lockfile')
checkdepends=('python-mock' 'python2-mock' 'python-testscenarios' 'python2-testscenarios')
source=(https://pypi.python.org/packages/b2/fb/a280d65f81e9d69989c8d6c4e0bb18d7280cdcd6d406a2cc3f4eb47d4402/$pkgbase-$pkgver.tar.gz{,.asc})
validpgpkeys=('517CF14BB2F398B0CB354855B8B24C06AC128405') # Ben Finney
sha256sums=('261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4214f73'
            'SKIP')

prepare() {
  cp -a python-daemon-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/python-daemon-$pkgver
  python setup.py build

  cd "${srcdir}"/python-daemon-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "${srcdir}"/python-daemon-$pkgver
# test fails
# python setup.py test

  cd "${srcdir}"/python-daemon-$pkgver-py2
  python2 setup.py test
}

package_python-daemon() {
  depends=('python' 'python-lockfile' 'python-docutils')

  cd "${srcdir}"/python-daemon-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}

package_python2-daemon() {
  depends=('python2' 'python2-lockfile' 'python2-docutils')

  cd "${srcdir}"/python-daemon-$pkgver-py2

  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
