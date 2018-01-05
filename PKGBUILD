# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=efax-gtk
pkgver=3.2.13
pkgrel=4
pkgdesc="A GUI front end for the 'efax' fax program"
arch=('x86_64')
url="http://efax-gtk.sourceforge.net/"
license=('GPL')
depends=('dbus-glib' 'ghostscript' 'c++-gtk-utils')
makedepends=('pkg-config')
optdepends=('heirloom-mailx: to use the mail_fax script')
backup=('etc/efax-gtkrc')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.src.tgz")
md5sums=('87cfd9c0894080690474d2696782f79d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-spooldir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -m 755 mail_fax print_fax "${pkgdir}/usr/bin"
}
