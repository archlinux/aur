# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=libfs
pkgver=1.0.9
pkgrel=1
pkgdesc="X Font Service client library"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'xorgproto')
makedepends=('xtrans')
source=(${url}/releases/individual/lib/libFS-${pkgver}.tar.xz{,.sig})
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"
sha256sums=('597379438b3242ccc7d7b0fc432dc6c844eca0d4a82a7b82518bfeb203fc208a'
            'SKIP')

build() {
  cd libFS-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd libFS-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

