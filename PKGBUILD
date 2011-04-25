# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.0.1
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
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('a4c2ec5935c0cea0da1958e7f27a925a03867854cdcaf904ce8c7e405ebe2e5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Disable Spice until someone cares (file a bug!)
  ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
      --libexecdir=/usr/lib/vinagre --enable-rdp --disable-spice
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
