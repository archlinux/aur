# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=squashfs-tools-ng
pkgver=1.0.0
pkgrel=2
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc}
	https://infraroot.at/pub/squashfs/patches-1.0.0/0001-fix-sqfsbrowse-build.patch{,.asc}
        https://infraroot.at/pub/squashfs/patches-1.0.0/0002-Fix-block-bounds-checking-in-libsquashfs-data-reader.patch{,.asc})
sha512sums=('536f12aa53214f88739cea0d26c55e04434c284935ff1d59ee8f5108acd92fc11e800e42e3a112524d09dbd1fa50c4f15c3211ff5d02ae50b7fa137600d2ae15'
            'SKIP'
	    '2eda78858456305946fad7ca72e56d843d2c27201f3d441b347cd41ba1680ec1d8779455256e2370b160a456bb2d5fc35c782eea7af3fe08dcaccfc4b6856d8b'
	    'SKIP'
	    'c01b2b1562970398f39d1acac7f65ec91f6711b2dbda59e9c7a5cb8ed6cd14fa31a8a3c1ea1f78df4015f0745ea086f591c763feb189676df885c8621597ac8f'
	    'SKIP'
	   )
validpgpkeys=('13063F723C9E584AEACD5B9BBCE5DC3C741A02D1')

prepare() {
  cd ${pkgname}-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/0001-fix-sqfsbrowse-build.patch"
  patch --forward --strip=1 --input="${srcdir}/0002-Fix-block-bounds-checking-in-libsquashfs-data-reader.patch"
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
