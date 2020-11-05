# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=squashfs-tools-ng
pkgver=1.0.3
pkgrel=1
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc})
sha512sums=('32e0084b1343de07b450e5337398618475a57c91c6f351c73bb7aa3dd6b5dc83aeca924f3d624ce802c9e1d600389a76cbca7b841104259d32f3ef2c7f13db67'
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
