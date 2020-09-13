# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-iotbot-git
_gitname=python--iotbot
pkgver=r163.eb90283
pkgrel=1
pkgdesc="IOTBOT/IOTQQ SDK with Python."
arch=('any')
url="https://github.com/xiyaowong/${_gitname}"
license=('MIT')
depends=('python-socketio'
         'python-websocket-client'
         'python-requests'
         'python-prettytable'
         'python-loguru'
         'python-schedule')
makedepends=('git')
conflicts=('python-iotbot')
provides=('python-iotbot')
source=("git://github.com/XiyaoWong/${_gitname}.git")
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
}
# vim: ts=2 sw=2 et:
