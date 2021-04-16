# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=efax-gtk
pkgver=3.2.15
pkgrel=1
pkgdesc="A GUI front end for the 'efax' fax program"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="http://efax-gtk.sourceforge.net/"
license=(GPL)
depends=(dbus-glib ghostscript c++-gtk-utils)
optdepends=('s-nail: to use the mail_fax script')
backup=('etc/efax-gtkrc')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.src.tgz")
sha256sums=('c43514fb2cd83390b82dba830fcbff3d6614d392c94d1da6312368d02acd211d')

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
