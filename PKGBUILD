# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=gfs2-utils
pkgver=3.2.0
pkgrel=1
pkgdesc="Utilities for managing the global file system (GFS2)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="https://sourceware.org/cluster/gfs/"
depends=('libutil-linux' 'ncurses' 'zlib' 'python' 'sh')
makedepends=('util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "fix-linking.patch")
options=('staticlibs')
sha512sums=('16b2522b8fb6d928176d4823e382c3198ebe068260a090a3592095675dcacea0ccf878e9e994ac832995b9628311562ed6425123acd39a4ef81f8a6503fae46a'
            '3f182644b0e3f7bc9e593aecd9136339e964875a3af461229e35148bfe766d798eeda80a2c332f15e49a9c4b85bf86ee0d42fae45295a8c85f79f7a077953fc6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # this is fixed upstream
  patch -Np1 -i "${srcdir}/fix-linking.patch"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
