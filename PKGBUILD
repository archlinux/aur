# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-axelrod')
pkgver=4.4.0
pkgrel=2
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
            '4d9d11b7d8ccd2074295b92b4961fd76b25e3948cb8e9836acd0123a5b6166f2')
source=("$url/archive/v$pkgver.tar.gz"
        "$url/commit/8dba4c0.patch")

prepare() {
  cd "$srcdir/Axelrod-$pkgver"

  # Reverse the 8dba4c0 commit as we have prompt_toolkit v2, not v1
  patch -Rp1 < "$srcdir/8dba4c0.patch"

  # Avoid installing optional/unrequired dependencies
  echo > "requirements.txt"
}

package() {
  cd "$srcdir/Axelrod-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
