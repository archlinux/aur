# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.7.0
pkgrel=1
pkgdesc="Git commit message linter"
arch=('any')
depends=('python' 'python-click' 'python-ordereddict' 'python-sh')
makedepends=('python-setuptools')
url="https://jorisroovers.github.io/gitlint/"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jorisroovers/$pkgname/tar.gz/v$pkgver)
sha256sums=('dc4de35e652f86675b7ab2fb89707645a596346ce214d55a1d88999719485361')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing setup.py...'
  sed -i 's/Click==5.1/Click/' setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
