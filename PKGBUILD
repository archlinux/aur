# $Id$
# Maintainer: Heine Pedersen <heinep at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
epoch=1
pkgver=1.2.0rcgit.20
pkgrel=1
pkgdesc="remote desktop client written in GTK+ (compiled with appindicator)"
arch=(i686 x86_64)
url="http://www.remmina.org/"
license=('GPL')
depends=('gtk3' 'zlib' 'libjpeg' 'libssh' 'avahi' 'vte3'
	 'libgcrypt' 'libxdmcp' 'libsecret' 'webkit2gtk' 'libappindicator-gtk3')
makedepends=('intltool' 'pkgconfig' 'cmake' 'libgnome-keyring'
             'avahi' 'libxkbfile' 'freerdp' 'telepathy-glib'
             'libvncserver' 'spice-protocol' 'spice-gtk3')
optdepends=('libxkbfile'
            'freerdp'
            'telepathy-glib'
            'gnome-keyring'
            'nxproxy'
            'spice-gtk3'
            'xorg-server-xephyr: XDMCP support'
            'libvncserver: VNC client/server support')
replaces=('remmina-plugins')
provides=('remmina-plugins', 'remmina')
conflicts=('remmina')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeRDP/Remmina/archive/v${pkgver/rc/-rc}.tar.gz")
sha256sums=('5663105735600cfe5dbbcd62e64ffb27bb6587e1035b04b2b63a32a98d25ef30')

build() {
  cd "$srcdir"/Remmina-${pkgver/rc/-rc}/
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_APPINDICATOR=ON .
  make
}

package() {
  cd "$srcdir"/Remmina-${pkgver/rc/-rc}/
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/build
}
