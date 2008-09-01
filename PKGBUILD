# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=pidgin
pkgver=2.5.1
pkgrel=1
pkgdesc="Multi-protocol instant messaging client"
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'gtkspell' 'libxss' 'gstreamer0.10' 'nss' 'hicolor-icon-theme')
makedepends=('avahi' 'tk' 'ca-certificates' 'perlxml' 'python')
optdepends=('avahi: Bonjour protocol support'
            'tk: Tcl/Tk scripting support'
            'ca-certificates: SSL CA certificates')
replaces=('gaim')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2)
md5sums=('f76c269c02fafee9b45cc2a50b43b1f3')

build() {
  cd "$srcdir/pidgin-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
    --disable-nm --disable-perl --disable-gnutls --disable-doxygen \
    --with-system-ssl-certs=/etc/ssl/certs || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  # Remove GConf schema file
  rm -rf "$pkgdir/etc" || return 1
}
