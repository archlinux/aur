# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-aioblescan-git
_pkgname=${pkgname%-git}
_gitname=${_pkgname#python-}
pkgver=0.2.4.r41.g84ef42a
pkgrel=1
pkgdesc="A Python asyncio library to listen for BLE advertized packets"
arch=('any')
url="https://github.com/frawau/aioblescan"
license=('MIT')
depends=('python')
makedepends=("python-setuptools"
	     "git")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}

  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}

  python setup.py build
}

package() {
  cd ${_gitname}

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
