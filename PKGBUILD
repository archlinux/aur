# vim: set et sw=2:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ypbind-mt
pkgver=2.5
pkgrel=1
pkgdesc='Linux NIS daemon'
url='https://github.com/thkukuk/ypbind-mt'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('libxslt' 'libxml2' 'docbook-xml' 'docbook-xsl')
depends=('yp-tools' 'libsystemd')
backup=('etc/yp.conf')
source=("$url/releases/download/v$pkgver/ypbind-mt-$pkgver.tar.xz"
        'ypbind.service'
        'ypbind.conf')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 etc/yp.conf "${pkgdir}"/etc/yp.conf
  install -D -m644 ../ypbind.service "${pkgdir}"/usr/lib/systemd/system/ypbind.service
  install -D -m644 ../ypbind.conf "${pkgdir}"/usr/lib/tmpfiles.d/ypbind.conf
}

md5sums=('86a724d30dd8d65f53a4de28b7344ca1'
         '50e05f057ec0603243e3d334aaa0934f'
         '3d6a8eb44771f81abb47d14d9e4f301d')
