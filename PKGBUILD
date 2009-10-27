# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=pidgin
pkgver=2.6.3
pkgrel=1
pkgdesc="Multi-protocol instant messaging client"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'gtkspell' 'libxss' 'nss' 'libsasl' 'python'
	'hicolor-icon-theme' 'silc-toolkit' 'gstreamer0.10-base' 'farsight2')
makedepends=('avahi' 'tk' 'ca-certificates' 'intltool')
optdepends=('gstreamer0.10-good: to play sounds'
	'avahi: Bonjour protocol support'
	'tk: Tcl/Tk scripting support'
	'ca-certificates: SSL CA certificates'
	'aspell: for spelling correction')
replaces=('gaim')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8d0ff6215b2d023eaa8efef59097ef83')

build() {
  cd ${srcdir}/${pkgname}-$pkgver

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-schemas-install \
              --disable-meanwhile \
              --disable-nm \
              --disable-perl \
              --enable-gnutls=no \
              --enable-cyrus-sasl \
              --disable-doxygen \
              --with-system-ssl-certs=/etc/ssl/certs || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  # Remove GConf schema file
  rm -rf "$pkgdir/etc" || return 1
}
