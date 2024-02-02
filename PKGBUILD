_name=python-dateutil
pkgname=python2-dateutil
pkgver=2.8.2
pkgrel=3
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('Apache-2.0')
url="https://github.com/dateutil/dateutil"
depends=('python2' 'python2-six')
makedepends=('python2-setuptools-scm' 'python2-six' 'git')
checkdepends=('python2-pytest' 'python2-packaging' 'python2-pytest-cov' 'python2-hypothesis' 'python2-freezegun')
source=("https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/$_name-$pkgver.tar.gz")
sha256sums=('0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
  cd "${srcdir}/$_name-$pkgver"
  PYTHONPATH="$(pwd)/build/lib" python2 -m pytest -k 'not dateutil/test/property/test_tz_prop.py'
}
