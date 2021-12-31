# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('dose')
pkgver=1.2.2
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
sha256sums=('e2e69fbbe656862065aee13cb63aea2a7aeb95df0af7c4137f88f0ccfa11502d')
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
