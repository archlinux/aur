# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Karthik <kndevl@outlook.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: Kevin Slagle <kjslag at gmail dot com>

pkgname=python-snakeviz
_pythonname=snakeviz
pkgver=2.1.1
pkgrel=1
pkgdesc='A viewer for Python profiling data'
arch=('any')
url="http://jiffyclub.github.io/snakeviz"
license=('BSD')
depends=('python' 'python-tornado')
source=("$_pythonname-$pkgver.tar.gz::https://github.com/jiffyclub/snakeviz/archive/v$pkgver.tar.gz")
sha256sums=('2ebaa1eb6f73b4c8aff3b7585eaf58c0b4178453d01f11cea198fd9020763049')
checkdepends=(python-pytest)
options=(!emptydirs)

build() {
  cd "$_pythonname-$pkgver"
  python setup.py build 
}

package() {
  cd "$_pythonname-$pkgver/"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

check() {
  cd "$_pythonname-$pkgver"
  PYTHONPATH=. pytest tests
}
# vim:set ts=2 sw=2 et:
