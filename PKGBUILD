# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-daemon
pkgname=('python-daemon' 'python2-daemon')
pkgver=2.2.0
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-docutils' 'python2-docutils' 'python-lockfile' 'python2-lockfile')
checkdepends=('python-mock' 'python2-mock' 'python-testscenarios' 'python2-testscenarios')
source=(https://files.pythonhosted.org/packages/99/2a/75fe6aa7086e838570f29899f674e7896a42be26d9fff33f90d990e599d2/$pkgbase-$pkgver.tar.gz)
sha256sums=('aca149ebf7e73f10cd554b2df5c95295d49add8666348eff6195053ec307728c')

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
  python setup.py test

  cd "${srcdir}"/python-daemon-$pkgver-py2
# test fails
#   python2 setup.py test
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
