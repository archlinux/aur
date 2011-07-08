# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.0.2
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libgnome-keyring' 'gtk-vnc' 'avahi' 'desktop-file-utils' 'hicolor-icon-theme' 'telepathy-glib' 'dconf' 'libpeas' 'shared-mime-info' 'gnome-icon-theme')
optdepends=('rdesktop: RDP plugin')
makedepends=('gtk-doc' 'intltool' 'rdesktop')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('cddc604ca6b2e45aaa5af55306eb29fc4910b29e1273c4915b7f60fd78da264e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
      --libexecdir=/usr/lib/vinagre --enable-rdp --disable-spice
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
