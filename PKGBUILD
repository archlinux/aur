# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme
pkgver=1.4.1
pkgrel=1
pkgdesc="A C wrapper library for GnuPG"
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('GPL')
depends=('libgpg-error' 'pth' 'gnupg>=2')
install=${pkgname}.install
options=('!libtool' '!emptydirs')
source=(ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig})
md5sums=('07f1c0eb6596a94efa3ffb75e74bfbba'
         'SKIP')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static --disable-gpgsm-test
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
