# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.10.0
pkgrel=2
pkgdesc="A VNC Client for the GNOME Desktop"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi desktop-file-utils dconf shared-mime-info
         gnome-icon-theme spice-gtk3)
optdepends=('openssh: SSH plugin'
            'freerdp: RDP plugin')
makedepends=(docbook-xsl intltool freerdp openssh itstool)
groups=(gnome-extra)
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d90ca19d1075149d044a58274016bb3976b2201774ae079d661fd7c3859a1900')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/$pkgname --enable-rdp
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
