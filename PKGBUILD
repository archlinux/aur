# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-jsonrpclib-git
pkgver=20131025
pkgrel=1
pkgdesc="Python JSON-RPC over HTTP that mirrors xmlrpclib syntax"
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
url="https://github.com/joshmarshall/jsonrpclib"
license=('Apache')
source=(${pkgname%-git}::git+https://github.com/joshmarshall/jsonrpclib)
sha256sums=('SKIP')
provides=('python2-jsonrpclib')
conflicts=('python2-jsonrpclib')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
