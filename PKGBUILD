# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.8.0
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
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jorisroovers/$pkgname/tar.gz/v$pkgver
        requirements.txt.patch
        setup.py.patch)
sha256sums=('dbbbc8741fc4f9ede748fdeb8136bdaffe9b2a0bf66e16baf87ebf539c814d98'
            'e3bb9e56ee1d971f828d5cf3cff1b6293fc5860460670fd5114c6546f74339e4'
            '0bff8c9f7849cc16fcc3b124ccdb2fd7af25834372eedd82b381016524b5b368')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Loosening PyPi dependency restrictions...'
  patch -p1 < "$srcdir/requirements.txt.patch"
  patch -p1 < "$srcdir/setup.py.patch"
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
