# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
# Contributor: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog-devel
pkgver=7.3.20
pkgrel=1
pkgdesc='Prolog environment (development version)'
arch=('x86_64' 'i686')
url='http://www.swi-prolog.org/'
license=('GPL' 'LGPL')
depends=('gmp' 'readline' 'openssl' 'libarchive')
makedepends=('libxft' 'libjpeg' 'unixodbc' 'libxpm' 'libxinerama')
optdepends=('unixodbc: for using the odbc4pl library'
            'uuid: for using the uuid library'
            'libjpeg: for using the pl2xpce library'
            'libxpm: for using the pl2xpce library'
            'libxinerama: for using the pl2xpce library'
            'libxft: for using the pl2xpce library'
            'java-environment: for interfacing java with the jpl package')
#options=('!makeflags')
source=("http://swi-prolog.org/download/devel/src/swipl-${pkgver}.tar.gz")
sha256sums=('8dd5a73ce454e68b45a11f0aebb64bbe668a06e35198c2c12d176af9c1c19d69')
conflicts=('swi-prolog')
provides=('swi-prolog')

build() {
  cd "swipl-$pkgver"

  ./configure --prefix=/usr --with-world
  cd src
  ./configure --enable-shared --enable-readline --prefix=/usr

  make -C ..
}

check() {
  make -C "swipl-$pkgver" check || true
}

package() {
  make -C "swipl-$pkgver" DESTDIR="$pkgdir" install

  # Fix for FS#20873
  chmod +x "$pkgdir/usr/lib/swipl-$pkgver/library/dialect/sicstus/swipl-lfr.pl"
}

