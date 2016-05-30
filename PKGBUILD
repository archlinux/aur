# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Jack O'Connor <oconnor663@gmail.com>

pkgname=peru
pkgver=1.0.0
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
sha256sums=('386936ce853ed4d9d9b801d1c7d05295e54ceafebbb86fb89e78e27f504f6045')

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
