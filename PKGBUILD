# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-iotbot-git
_gitname=python--iotbot
pkgver=r98.4d15662
pkgrel=2
pkgdesc="IOTBOT/IOTQQ SDK with Python."
arch=('any')
url="https://github.com/xiyaowong/${_gitname}"
license=('MIT')
depends=('python-socketio'
         'python-websocket-client'
         'python-requests'
         'python-colorama'
         'python-prettytable'
         'python-schedule')
makedepends=('git')
conflicts=('python-iotbot')
provides=('python-iotbot')
source=("git://github.com/XiyaoWong/${_gitname}.git")
install=".INSTALL"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  mv ${pkgdir}/usr/bin/iotbot ${pkgdir}/usr/bin/pyiotbot
}
# vim: ts=2 sw=2 et:
