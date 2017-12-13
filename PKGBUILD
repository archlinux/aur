# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.9.0
pkgrel=1
pkgdesc="Git commit message linter"
arch=('any')
depends=('python'
         'python-arrow'
         'python-click'
         'python-ordereddict'
         'python-sh')
makedepends=('python-setuptools')
url="https://jorisroovers.github.io/gitlint/"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jorisroovers/$pkgname/tar.gz/v$pkgver)
sha256sums=('b5f6fa48f385d5106d33baf65d1f179be4e8e39af08cc09f14a3c667c38de57f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Loosening PyPi dependency restrictions...'
  sed -i 's/==1\.11//' requirements.txt setup.py
  sed -i 's/==6\.6//' setup.py
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
