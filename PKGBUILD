# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=squashfs-tools-ng
pkgver=0.9
pkgrel=1
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://github.com/AgentD/squashfs-tools-ng'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc})
sha512sums=('6394cb851828f110ed6a3ab17923b214b79b8bb5550069407839da62e5316459d7f564cb31211c849508b9664f4f1f9030ce5f64d5c8649b8a73c3a869ab22d0'
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
