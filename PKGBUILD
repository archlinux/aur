# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-axelrod')
pkgver=4.13.0
pkgrel=1
pkgdesc="Research tool for the Iterated Prisoner's Dilemma"
arch=('any')
url='https://github.com/Axelrod-Python/Axelrod'
license=('MIT')
checkdepends=('python-hypothesis')
makedepends=('python-setuptools' 'python-prompt_toolkit')
depends=('python-dask' 'python-matplotlib' 'python-numpy' 'python-pandas'
         'python-yaml' 'python-scipy' 'python-tqdm')
optdepends=('python-prompt_toolkit: enable the Human strategy')
options=(!emptydirs)
sha256sums=('b0e1f58c3220bd6e8fb2ce8bf60e35c785dbeaa32e82e0d23361fd7bd7267e60')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/Axelrod-$pkgver"

  # No longer necessary but avoids messing with dask dependencies
  echo > "requirements/requirements.txt"
}

check() {
  cd "$srcdir/Axelrod-$pkgver"
  ./test
}

package() {
  cd "$srcdir/Axelrod-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
