# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-daemon
pkgname=('python-daemon' 'python2-daemon')
pkgver=2.2.4
pkgrel=3
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-docutils' 'python2-docutils' 'python-lockfile' 'python2-lockfile')
checkdepends=('python-mock' 'python-testscenarios')
source=(https://files.pythonhosted.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz)
sha256sums=('57c84f50a04d7825515e4dbf3a31c70cc44414394a71608dee6cfde469e81766')

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
  cd python-daemon-$pkgver
  python setup.py test
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
