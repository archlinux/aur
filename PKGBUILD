# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=2.30.3
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libgnome-keyring>=2.32.0' 'gtk-vnc>=0.3.10' 'avahi>=0.6.27' 'desktop-file-utils' 'hicolor-icon-theme' 'telepathy-glib>=0.12.0' 'gconf>=2.32.0')
makedepends=('gnome-doc-utils>=0.20.1' 'intltool' 'gnome-panel-bonobo')
optdepends=('gnome-panel-bonobo: Remote desktop viewer applet')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/vinagre/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('28bfc70a816bc3f1e71ada82e260c39ee2dac693cb7859323b06c8b1452a39f4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
      --libexecdir=/usr/lib/vinagre
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain vinagre ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
