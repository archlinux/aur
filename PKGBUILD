# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.4.23
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
    vte3
    webkit2gtk
)
optdepends=(
    #'freerdp: RDP plugin'
    #'libsecret: Secret plugin'
    #'libvncserver: VNC plugin'
    'spice-gtk: Spice plugin'
    #'pyhoca-cli: X2Go plugin'
    #'webkit2gtk: WWW plugin'
    'gtk-vnc: GVNC plugin'
    'kwallet: kwallet plugin'
    'gnome-terminal: external tools')

makedepends=(
    cmake
    freerdp
    gobject-introspection
    gtk-vnc
    harfbuzz
    kwallet
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
sha512sums=('73ce0482d33ba8e7a0960e8f3de3982818de2f96578f00c0cc3d7043a97fa6dee0c71acc8be155df7fbd063cd498be190bb78d2ff668a16de0946b965951cf71')

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
  cd "$srcdir"/Remmina-v${pkgver/rc/-rc}/
  make DESTDIR="$pkgdir" install
}
