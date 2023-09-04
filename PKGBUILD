# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgname=python-future
pkgver=0.18.3
pkgrel=2
pkgdesc="Clean single-source support for Python 3 and 2"
url="https://python-future.org/"
arch=('any')
license=('MIT')
depends=('python')
provides=('futurize' 'pasteurize')
checkdepends=('python-requests' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-setuptools: futurize and pasteurize scripts')
options=('!emptydirs')
source=("https://pypi.io/packages/source/f/future/future-$pkgver.tar.gz")
sha512sums=('6de56a5aa5c5dd56a0dc5a6732c753530f9868036bd97e9d355f9ee6e1305e266a60c167de779cba93f09b5b3fae615193074caba2afe857ca7ea944532ef910')

build() {
  cd "$srcdir"/future-$pkgver
  python -m build --wheel
}

check() {
  cd "$srcdir"/future-$pkgver
  # test_future needs python2 so it is disabled here
  #PYTHONPATH="$PWD/build/lib:$PYTHONPATH" pytest -v tests/test_future
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" pytest -v tests/test_past
}

package() {
  cd future-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
