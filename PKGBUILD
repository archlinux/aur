# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>

_pkgbasename=dietlibc
pkgname="lib32-${_pkgbasename}"
pkgver=0.34
pkgrel=1
pkgdesc='A C library optimized for small size (32-bit)'
arch=('x86_64')
url='https://www.fefe.de/dietlibc/'
depends=("$_pkgbasename")
license=('GPL')
options=('staticlibs')
source=("https://www.fefe.de/dietlibc/dietlibc-${pkgver}.tar.xz"{,.sig})
sha256sums=('7994ad5a63d00446da2e95da1f3f03355b272f096d7eb9830417ab14393b3ace'
            'SKIP')
validpgpkeys=('878CBE5DA9A50595E674183F15396A7933EB059A'
              '2DEC330151BB9F7DAD8B0BDCFC32CEECA534A9C6')

build() {
    make -C "${_pkgbasename}-${pkgver}" CC='gcc -m32' MYARCH='i386'
}

package() {
    make -C "${_pkgbasename}-${pkgver}" MYARCH='i386' DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/opt/diet"/{bin,include,man}
}
