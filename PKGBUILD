# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-axelrod')
pkgver=4.12.0
pkgrel=1
pkgdesc="Research tool for the Iterated Prisoner's Dilemma"
arch=('any')
url='https://github.com/Axelrod-Python/Axelrod'
license=('MIT')
checkdepends=('python-hypothesis')
makedepends=('python-setuptools')
depends=('python-dask'
         'python-matplotlib' 'python-numpy' 'python-pandas'
         'python-prompt_toolkit' 'python-yaml' 'python-scipy'
         'python-tqdm')
options=(!emptydirs)
sha256sums=('5360e7e52a8fdf8e2f8af5e59f4e0fb54f11f245103ed77be91f854e6848b019')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/Axelrod-$pkgver"

  # Avoid installing optional/unrequired dependencies
  echo > "requirements.txt"
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
