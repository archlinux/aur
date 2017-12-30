# Maintainer: Ryder McMinn <mcminnra at gmail dot com>	

pkgname=bodylogger
pkgver=0.7.0
pkgrel=1
pkgdesc="
Maintains a user database of personal measurements while giving stats and predictions based on trends."
url="https://github.com/rmcminn/bodylogger"
arch=('any')
license=('MIT')
depends=('python' 'python-pip' 'tk' 'python-setuptools')
makedepends=('git')
source=(git://github.com/rmcminn/bodylogger.git)
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