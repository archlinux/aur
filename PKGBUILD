# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=pianod
pkgver=167
pkgrel=1
pkgdesc="Pandora Client Daemon"
url="http://deviousfish.com/pianod/"
arch=('x86_64' 'i686')
license=('mit')
depends=('mksh' 'libao' 'libgcrypt' 'gnutls' 'json-c' 'faad2' 'libmad')
source=("http://deviousfish.com/Downloads/pianod/${pkgname}-${pkgver}.tar.gz" )
md5sums=('f95ddd849f3fd213a78c28fc8b47f345')
backup=('etc/pianod.startscript' 'etc/pianod.env')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/contrib"
  sed -i 's|/bin/ksh|/bin/mksh|' piano runmix
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 contrib/pianod.service "$pkgdir/usr/lib/systemd/system/pianod.service"
  install -Dm644 contrib/pianod.env "$pkgdir/etc/pianod.env"
  install -Dm644 contrib/startscript-example "$pkgdir/etc/pianod.startscript"
}

# vim:set ts=2 sw=2 et:
