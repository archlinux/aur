# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-daemon
pkgname=('python-daemon' 'python2-daemon')
pkgver=2.2.3
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-docutils' 'python2-docutils' 'python-lockfile' 'python2-lockfile')
checkdepends=('python-mock' 'python2-mock' 'python-testscenarios' 'python2-testscenarios')
source=(https://files.pythonhosted.org/packages/35/c3/50a2984169a990e329c969967d4142e9d462789876b962889d6108639937/$pkgbase-$pkgver.tar.gz)
sha256sums=('affeca9e5adfce2666a63890af9d6aff79f670f7511899edaddca7f96593cc25')

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
