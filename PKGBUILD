# Maintainer: FredBezies <fredbezies at gmail dot com>
# Contributor: Ian D. Scott <ian@perebruin.com>
pkgname=pianod
_pkgname=pianod2
pkgver=420
pkgrel=1
pkgdesc="Pandora Client Daemon"
url="http://deviousfish.com/pianod/"
arch=('x86_64' 'i686')
license=('mit')
depends=('mksh' 'libao' 'libgcrypt' 'gnutls' 'json-c' 'faad2' 'libmad')
source=("http://deviousfish.com/Downloads/pianod2/${_pkgname}-${pkgver}.tar.gz" )
backup=('etc/pianod.startscript' 'etc/pianod.env')
sha256sums=('9fa739cf28d5f554d982acecb94857b9fe0d0fd839d238dfca90f143c9fab216')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}/contrib"
  sed -i 's|/bin/ksh|/bin/mksh|' piano runmix
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 contrib/pianod.service "$pkgdir/usr/lib/systemd/system/pianod.service"
  install -Dm644 contrib/startscript-example "$pkgdir/etc/pianod.startscript"
}

# vim:set ts=2 sw=2 et:
