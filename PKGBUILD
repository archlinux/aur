# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme
pkgver=1.3.1
pkgrel=1
pkgdesc="A C wrapper library for GnuPG"
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('GPL')
depends=('libgpg-error' 'pth' 'gnupg' 'gnupg2')
install=${pkgname}.install
options=('!libtool' '!emptydirs')
source=(ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
  rm ${pkgdir}/usr/share/info/dir
  gzip ${pkgdir}/usr/share/info/*
}
md5sums=('90afa8436ce2b2683c001c824bd22601')
