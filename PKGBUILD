# Maintainer: Julian Sanin <sanin89julian@gmail.com>

pkgname=liberasurecode
pkgver=1.1.0
pkgrel=1
pkgdesc="Erasure Code API library written in C with pluggable Erasure Code backends"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
url="https://github.com/openstack/liberasurecode"
makedepends=('doxygen')
source=("${url}/archive/v${pkgver}.tar.gz"
        "disable-sse.patch")
md5sums=('04f9d15cd5e645392811dd5e96e68c98'
         'a088b148c73df00f8aa72e3edd1e2818')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 <../disable-sse.patch
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
  mkdir -p ${pkgdir}/usr/include
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
