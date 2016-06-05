# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=fsniper
pkgver=1.3.1
pkgrel=2
pkgdesc='Daemon to run scripts based on changes in files monitored by inotify'
url='http://projects.l3ib.org/fsniper/'
license=('GPL3')
depends=('pcre' 'file')
makedepends=('autoconf' 'automake' 'libtool' 'gcc')
source=("http://projects.l3ib.org/fsniper/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e65a34221fc05eb7ececcd2fb783e3418de032f89082e09be3a8f75f6b056e6b')
arch=('i686' 'x86_64')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  install -m644 -D ${srcdir}/${pkgname}-${pkgver}/README \
                   ${pkgdir}/usr/share/${pkgname}/README
  install -m644 -D ${srcdir}/${pkgname}-${pkgver}/example.conf \
                   ${pkgdir}/usr/share/${pkgname}/example.conf
}

# vim:set ts=2 sw=2 ft=sh et:
