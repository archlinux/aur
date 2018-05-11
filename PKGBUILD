# vim: set et sw=2:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ypbind-mt
pkgver=2.4
pkgrel=3
pkgdesc='Linux NIS daemon'
url='https://github.com/thkukuk/ypbind-mt'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('libxslt' 'libxml2' 'docbook-xml' 'docbook-xsl')
depends=('yp-tools' 'libsystemd')
backup=('etc/yp.conf')
source=("$url/archive/$pkgname-$pkgver.tar.gz"
        'ypbind.service'
        'ypbind.conf'
        'fixes.patch')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  patch -Np2 -b -z .orig <../fixes.patch
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 etc/yp.conf "${pkgdir}"/etc/yp.conf
  install -D -m644 ../ypbind.service "${pkgdir}"/usr/lib/systemd/system/ypbind.service
  install -D -m644 ../ypbind.conf "${pkgdir}"/usr/lib/tmpfiles.d/ypbind.conf
}

md5sums=('11f09789cc8bb4d844798c3535c30208'
         '50e05f057ec0603243e3d334aaa0934f'
         '3d6a8eb44771f81abb47d14d9e4f301d'
         '17374b15cfa85bae36ee1948600821e6')
