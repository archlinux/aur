# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('dose')
pkgver=1.2.3
pkgrel=1
pkgdesc="Traffic light/signal/semaphore GUI for test driven development (TDD)"
arch=('any')
url='https://github.com/danilobellini/dose'
license=('GPL3')
checkdepends=('python-pytest' 'python-pytest-cov' 'flake8')
makedepends=('python-setuptools')
depends=('python-watchdog' 'python-colorama' 'python-docutils'
         'python-wxpython')
options=(!emptydirs)
sha256sums=('c611399f7de2236b7f4e6b8e559eff6b44bf8643877403d2bf7001a3f7879a0e')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m pytest -k 'not test_homebrew_shared_outside_cellar and '`
                     `'not test_get_without_setuptools'
  flake8
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
