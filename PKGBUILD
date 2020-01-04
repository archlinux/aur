# Maintainer: Axel Gembe <derago@gmail.com>
pkgname=fulcrum-git
_pkgname=${pkgname/-git/}
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=94e90f2
pkgrel=1
url='https://github.com/cculianu/Fulcrum'
arch=('any')
license=('GPL3')
depends=('qt5-base')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/cculianu/Fulcrum.git")
sha256sums=('SKIP')

_qmake_args="CONFIG+=release"

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD
}

prepare() {
  cd "$pkgname"
  qmake -makefile Fulcrum.pro
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 Fulcrum "$pkgdir"/usr/bin/Fulcrum
  install -Dm644 misc/fulcrum-example-config.conf "$pkgdir"/usr/share/doc/$pkgname/fulcrum-example-config.conf
}
