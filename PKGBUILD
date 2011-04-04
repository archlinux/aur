# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.0.0
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libgnome-keyring' 'gtk-vnc' 'avahi' 'desktop-file-utils' 'hicolor-icon-theme' 'telepathy-glib' 'dconf' 'libpeas' 'shared-mime-info')
optdepends=('rdesktop: RDP plugin')
makedepends=('gtk-doc' 'intltool' 'rdesktop')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('c454b47264bbd424f345a79079f2651600ac8335d428c899e2b28d297450c124')

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
