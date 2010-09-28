# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=2.32.0
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=('i686' 'x86_64')
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
groups=('gnome-extra')
depends=('evolution-data-server>=2.32.0' 'nautilus>=2.32.0' 'dconf')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/2.32/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('890090b24381d91f079610d5454cb786a3ecefc91fa06649b2222be9bb02269a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-schemas-compile
  make
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}//usr/lib/nautilus-sendto/plugins/libnstbluetooth.so"
}
