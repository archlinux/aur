# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.4.6
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
sha512sums=('678b5319c5bb37db9c10fe5ce622f3be67dfe00d359a88330bdab5bd7bad26e707b0f59dc9a2d866009ad184a0bad7bdde77ed00c593077abad67f26b2e5fc28')

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
