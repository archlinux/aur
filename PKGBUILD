# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gpgme
pkgver=1.1.7
pkgrel=2
pkgdesc="A C wrapper library for GnuPG."
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('GPL')
depends=('libgpg-error>=1.5' 'pth' 'gnupg' 'gnupg2')
install=gpgme.install
options=('!libtool' '!emptydirs')
source=(ftp://ftp.gnupg.org/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8aecb72c4875540970e76e21a06934be')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/share/info/dir
  gzip ${pkgdir}/usr/share/info/*
}
