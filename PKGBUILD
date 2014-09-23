# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.14.0
pkgrel=1
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
sha256sums=('11d926c68d8f7e945d8ffcab192a35a96035a76abac0cde6de49c498908f3147')

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
