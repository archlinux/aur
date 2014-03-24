# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.12.0
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi desktop-file-utils dconf shared-mime-info
         gnome-icon-theme spice-gtk3)
optdepends=('openssh: SSH plugin'
            'freerdp: RDP plugin')
makedepends=(docbook-xsl intltool freerdp openssh itstool spice-protocol)
groups=(gnome-extra)
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('ee4d7ca5309f38c0a3298c03cf4a4b2c23e457bb459518d15f3608e2861e3473')

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
