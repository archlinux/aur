# Maintainer: Julian Sanin <sanin89julian@gmail.com>

pkgname=liberasurecode
pkgver=1.2.0
pkgrel=1
pkgdesc="Erasure Code API library written in C with pluggable Erasure Code backends"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
url="https://github.com/openstack/liberasurecode"
makedepends=('doxygen')
source=("${url}/archive/${pkgver}.tar.gz"
        "disable-sse.patch"
        "disable-doc-full-path-names.patch")
md5sums=('5c69a112c872267db2af8d3fc3bbc1d1'
         '7dd209992c2d9390e2ebcad67fc5e785'
         '961c0db9f9d1bb23ceee9b28480f42c5')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 <../disable-sse.patch
  patch -p1 <../disable-doc-full-path-names.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make test
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
