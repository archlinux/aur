# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=squashfs-tools-ng
pkgver=1.0.1
pkgrel=1
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc})
sha512sums=('3b597b7bf654c6897e04dc6c18cec6034a8f0c0fe070c8d6eb3c8f4a06f4ab2ea8c970ac18c12f05ccb3015cf911790e945798a34361fdb7d1a442a1ca646a04'
            'SKIP'
	   )
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
