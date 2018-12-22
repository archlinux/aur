# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Jack O'Connor <oconnor663@gmail.com>

pkgname=peru
pkgver=1.2.0
pkgrel=1
pkgdesc="A tool for fetching code"
arch=('any')
depends=('git' 'python' 'python-docopt' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('mercurial: fetching from hg repos'
            'subversion: fetching from svn repos')
url="https://github.com/buildinspace/peru"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/buildinspace/$pkgname/tar.gz/$pkgver)
sha256sums=('fb0fb02639e1c5403c9a6ddfd9719c5ea5ddf69fb440fbcfafe234470645e1dc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership docs/* "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
