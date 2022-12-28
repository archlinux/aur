# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.4.29
pkgrel=1
pkgdesc='remote desktop client written in GTK+ (compiled with appindicator and with some basic plugins added)'
arch=(x86_64)
url=https://www.remmina.org/
license=(GPL)
depends=(
    avahi
    freerdp
    libayatana-appindicator
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
    ninja
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
sha512sums=('8fbe822d07ec800bb739579b373003ee56cbc661fd0b635e5a7af0369d2e5450e7116907a87c34e82704c2aab790ac501ee6331946751660321c917ffd9a183e')

build() {
  cmake -S Remmina-v${pkgver/rc/-rc} -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_APPINDICATOR=ON \
    -DWITH_NEWS=OFF \
    -DWITH_KF5WALLET=OFF \
    -DWITH_X2GO=ON \
    -DWITH_GVNC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
