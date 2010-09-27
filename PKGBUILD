# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=2.31.90
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=('i686' 'x86_64')
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
groups=('gnome-extra')
depends=('evolution-data-server>=2.31.92' 'nautilus>=2.31.92')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/2.31/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('e93a8d509a5955721faf74ec99b3c00d37e0718e18d32bfada81856d658b397c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-schemas-compile
  make
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}//usr/lib/nautilus-sendto/plugins/libnstbluetooth.so"
}
