# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=squashfs-tools-ng
pkgver=1.0.0
pkgrel=1
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc})
sha512sums=('536f12aa53214f88739cea0d26c55e04434c284935ff1d59ee8f5108acd92fc11e800e42e3a112524d09dbd1fa50c4f15c3211ff5d02ae50b7fa137600d2ae15'
            'SKIP')
validpgpkeys=('13063F723C9E584AEACD5B9BBCE5DC3C741A02D1')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
