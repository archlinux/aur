# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=2.3.0
pkgrel=2
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
depends=('python' 'python-lockfile' 'python-docutils')
makedepends=('python-setuptools' 'python-docutils' 'python-lockfile' 'python-pip')
checkdepends=('python-mock' 'python-testscenarios' 'python-wheel')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
        testtools-2.5.0.patch
        python310.patch)
sha256sums=('bda993f1623b1197699716d68d983bb580043cf2b8a66a01274d9b8297b0aeaf'
            '7f8dfbe9e01edcb19ebede5580d448a995b721ee3b56ca1d353f58c36416c980'
            '1777e34936ed5d45001e9994f563fdf8c9e2045b667223f1eebf896031627ddc')

prepare() {
  cd "${srcdir}"/python-daemon-$pkgver
  patch -Np1 -i ../testtools-2.5.0.patch
  patch -Np1 -i ../python310.patch
}

build() {
  cd "${srcdir}"/python-daemon-$pkgver
  python setup.py build
}

check() {
  cd python-daemon-$pkgver
  python setup.py test
}

package_python-daemon() {
  cd "${srcdir}"/python-daemon-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
