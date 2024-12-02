# Maintainer: gilcu3
# Previous Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=3.1.1
pkgrel=1
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pagure.io/python-daemon/'
license=('Apache')
depends=('python' 'python-lockfile' 'python-setuptools')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-wheel' 'python-changelog-chug')
checkdepends=('python-testscenarios' 'python-testtools' 'python-coverage')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('a389d342aab7ac4c0e8397510af54ecb0d6919e2fced9bab7dd24f8c22265306')

# prepare() {
#   cd ${pkgname//-/_}-$pkgver
# }

build() {
  cd ${pkgname//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname//-/_}-$pkgver
  python -m unittest discover -v
}

package_python-daemon() {
  cd ${pkgname//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
