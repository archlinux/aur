# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.8.0
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libsecret' 'gtk-vnc' 'vte3' 'telepathy-glib' 'avahi' 'desktop-file-utils' 'dconf' 'shared-mime-info' 'gnome-icon-theme')
optdepends=('openssh: SSH plugin'
            'rdesktop: RDP plugin')
makedepends=('docbook-xsl' 'intltool' 'rdesktop' 'openssh' 'itstool')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('83d3b0e83aa804d8336b4779ce17d12365573c06f59abd3956092e3ab7d41b06')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vinagre --enable-rdp --disable-spice
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
