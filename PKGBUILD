# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.4.27
pkgrel=1
pkgdesc='remote desktop client written in GTK+ (compiled with appindicator and with some basic plugins added)'
arch=(x86_64)
url=https://www.remmina.org/
license=(GPL)
depends=(
    avahi
    freerdp
    libappindicator-gtk3
    libgcrypt
    libsecret
    libsodium
    libssh
    libvncserver
    spice-gtk
    vte3
    webkit2gtk
)
optdepends=(
    'gtk-vnc: GVNC plugin'
    'kwallet: kwallet plugin'
    'gnome-terminal: external tools')

makedepends=(
    cmake
    freerdp
    gobject-introspection
    gtk-vnc
    harfbuzz
    libvncserver
    spice-gtk
    spice-protocol
    telepathy-glib
    webkit2gtk
    xorgproto
)

provides=(
    remmina-plugins
    remmina
)

conflicts=(
    remmina-plugins
    remmina
)
replaces=(
    remmina-plugins
    remmina
)
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/Remmina/Remmina/-/archive/v${pkgver/rc/-rc}/Remmina-v${pkgver/rc/-rc}.tar.bz2")
sha512sums=('44bc067eaf2c4c10e42182aa7c3ec2aa18ec5c0ce51a2fc765884cbfc11261d3c0db537b1674424aa092caf171e647714dcc8af6d813273f7b96876a251e0575')

build() {
  cmake -S Remmina-v${pkgver/rc/-rc} -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_APPINDICATOR=ON \
    -DWITH_NEWS=OFF \
    -DWITH_KF5WALLET=ON \
    -DWITH_X2GO=ON \
    -DWITH_GVNC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
