# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Axel Gembe <derago@gmail.com>
pkgname=fulcrum-git
_pkgname=${pkgname/-git/}
pkgdesc='A fast & nimble SPV server for BCH, BTC, and LTC'
pkgver=1.12.0.1.r7.ga00f3e8
pkgrel=1
url='https://github.com/cculianu/Fulcrum'
arch=('any')
license=('GPL3')
depends=('qt6-base'
         'rocksdb'
         'python'
         'miniupnpc'
         'python-pyzmq')
makedepends=('git')
optdepends=('jemalloc: reduce memory fragmentation (recommended)')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/cculianu/Fulcrum.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/v\(.*\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  qmake -makefile CONFIG+=recheck CONFIG+=release Fulcrum.pro
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 Fulcrum "$pkgdir"/usr/bin/Fulcrum
  install -Dm755 FulcrumAdmin "$pkgdir"/usr/bin/FulcrumAdmin
  install -Dm644 doc/fulcrum-example-config.conf "$pkgdir"/usr/share/doc/$pkgname/fulcrum-example-config.conf
}
