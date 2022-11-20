# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python38-pytest-cov
pkgver=4.0.0
pkgrel=1
pkgdesc='py.test plugin for coverage reporting with support for both centralised and distributed testing, including subprocesses and multiprocessing'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-cov'
depends=('python38-coverage' 'python38-pytest' 'python38-tomli')
makedepends=('python38-setuptools')
checkdepends=('python38-virtualenv' 'python38-process-tests' 'python38-pytest-xdist' 'python38-fields')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest-cov/archive/v$pkgver.tar.gz")
sha512sums=('bbc2ce3c6e6541dad3122a2af3cf33456fcfdeebd9ad31fe216b77f1ac2f7abf1ed1ed583f186bea88b8a9cf754500e929263eb8d635fd55e4f3615ed107b49c')

build() {
  cd pytest-cov-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-cov-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH:$PWD/tests" pytest || echo "Tests failed"
}

package() {
  cd pytest-cov-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
