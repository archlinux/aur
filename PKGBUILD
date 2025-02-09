# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=reiserfsprogs
pkgver=3.6.27
pkgrel=5
pkgdesc="Reiserfs utilities"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL-2.0-only')
depends=('util-linux')
source=("https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        reiserfsprogs-3.6.27-loff_t.patch)
b2sums=('cd22120faa4d6d11ab545349fde5304f41cf3ca88b2c988255b7ca0e87961c9ccaa3095cad086e479a2b50627ad9bf3e90b2af46ddda64abc119e2a6755b8341'
        '6c38ac24d9d8e0bc665557303b5cc299fdd3a4529bc29370ffa8129499ac9d6e1f0a7ed66c93fefa1a647a304ae77309dc87deeeb8b29961398e509f30d0cb27')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "$srcdir"/reiserfsprogs-3.6.27-loff_t.patch
  autoreconf -i
}

build() {
  cd ${pkgname}-${pkgver}
  CFLAGS+=' -fgnu89-inline'
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
