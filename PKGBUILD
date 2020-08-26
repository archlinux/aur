# Maintainer: Axel Gembe <derago@gmail.com>
pkgname=fulcrum-git
_pkgname=${pkgname/-git/}
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.2.9.r22.g22d3d8f
pkgrel=1
url='https://github.com/cculianu/Fulcrum'
arch=('any')
license=('GPL3')
depends=('qt5-base'
         'rocksdb'
         'python')
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
