# Maintainer: Ryder McMinn <mcminnra at gmail dot com>	

pkgname=bodylogger
pkgver=0.8.0
pkgrel=1
pkgdesc="
Maintains a database of body weight measurements while giving stats and predictions based on trends."
url="https://github.com/rmcminn/bodylogger"
arch=('any')
license=('MIT')
depends=('python' 'python-pip' 'tk' 'python-setuptools')
makedepends=('git')
source=('bodylogger::git+https://github.com/rmcminn/bodylogger#branch=master')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  msg "GIT checkout done or server timeout"
  msg "Starting setup.py..."

  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/python|/usr/bin/env python2|'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p ~/".$pkgname"/users
  cp -u "$pkgname"/users/* ~/".$pkgname"/users
  python setup.py install --prefix=/usr --root="$pkgdir"
}