# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-axelrod')
pkgver=4.4.0
pkgrel=3
pkgdesc="Research tool for the Iterated Prisoner's Dilemma"
arch=('any')
url='https://github.com/Axelrod-Python/Axelrod'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-dask'
         'python-matplotlib' 'python-numpy' 'python-pandas'
         'python-prompt_toolkit' 'python-pygments' 'python-scipy'
         'python-tqdm')
options=(!emptydirs)
sha256sums=('1f8f8386ab292877e9c063aa371e0d5709a969cce9cba828ee95567be1858c7e'
            'd7497624ecafa3f9f57e0be82c8f88f3a12e34c1727266fbbbf2e66fd67ce370')
source=("$url/archive/v$pkgver.tar.gz"
        "$url/commit/0a7a1b0.patch")

prepare() {
  cd "$srcdir/Axelrod-$pkgver"

  # Apply the 0a7a1b0 commit as we have prompt_toolkit v2, not v1
  patch -p1 < "$srcdir/0a7a1b0.patch"

  # Avoid installing optional/unrequired dependencies
  echo > "requirements.txt"
}

package() {
  cd "$srcdir/Axelrod-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
