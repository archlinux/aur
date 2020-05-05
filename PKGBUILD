# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.4.3
pkgrel=1
pkgdesc='remote desktop client written in GTK+ (compiled with appindicator)'
arch=(x86_64)
url=https://www.remmina.org/
license=(GPL)
depends=(
    avahi
    libappindicator-gtk3
    libgcrypt
    libsodium
    libssh
    vte3
)
optdepends=(
    'freerdp: RDP plugin'
    'libsecret: Secret plugin'
    'libvncserver: VNC plugin'
    'libxkbfile: NX plugin'
    'nxproxy: NX plugin'
    'spice-gtk: Spice plugin'
    'telepathy-glib: Telepathy plugin'
    'xorg-server-xephyr: XDMCP plugin'
)
makedepends=(
    cmake
    freerdp
    harfbuzz
    libvncserver
    spice-gtk
    spice-protocol
    telepathy-glib
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
sha512sums=('ea88e2ce6355519eb6a5fd52b1860736a9b04741dda6a692a23aa52fb6a47900e6af57162604b692cb4ca6d63ffe564c5e4a317cd5f8b2e3ea6db0684cef3a68')

build() {
  cd "$srcdir"/Remmina-v${pkgver/rc/-rc}/
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DWITH_APPINDICATOR=ON .
  make
}

package() {
  cd "$srcdir"/Remmina-v${pkgver/rc/-rc}/
  make DESTDIR="$pkgdir" install
}
