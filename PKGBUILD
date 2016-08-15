# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Jack O'Connor <oconnor663@gmail.com>

pkgname=peru
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool for including other people's code in your projects"
arch=('any')
depends=('git' 'python' 'python-docopt' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('mercurial: fetching from hg repos'
            'subversion: fetching from svn repos')
url="https://github.com/buildinspace/peru"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/buildinspace/$pkgname/tar.gz/$pkgver)
sha256sums=('7b606653f33b868b0544ada30a037f669ceb6425aeabbf1f9998f44c2f972eb4')

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
