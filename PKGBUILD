# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.14.2
pkgrel=2
pkgdesc="A VNC Client for the GNOME Desktop"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi desktop-file-utils dconf shared-mime-info
         spice-gtk3 gnutls freerdp)
optdepends=('openssh: SSH plugin')
makedepends=(docbook-xsl intltool openssh itstool spice-protocol)
groups=(gnome-extra)
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('93983d9581303957b5a5935349a9d1e5b4a223c3a99c317047e4114884f839cf')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/$pkgname --enable-rdp --enable-spice
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
