# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-vex
pkgver=0.0.18
pkgrel=1
pkgdesc="Run commands in a virtualenv without modifying the current shell environment"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/sashahart/vex"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/v/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('15f42bb9ca100c8f7a377e1a8f21c86a')
sha256sums=('f8215e982e32bf7d4f8ca39a4aced64060ba198389163b785bd51b6bb311c1d4')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Renaming binary to vex2...'
  mv "$pkgdir/usr/bin/vex" "$pkgdir/usr/bin/vex2"
}
