# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme
pkgver=1.3.1
pkgrel=4
pkgdesc="A C wrapper library for GnuPG"
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('GPL')
depends=('libgpg-error' 'pth' 'gnupg>=2')
install=${pkgname}.install
options=('!libtool' '!emptydirs')
source=(ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig})
md5sums=('90afa8436ce2b2683c001c824bd22601'
         'a032ddc27177ef4ee54e25a231e62da5')
sha1sums=('7d19a95a2239da13764dad7f97541be884ec5a37'
          '93316a81a8f903c5b604716b6937884ea7b0917a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
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
