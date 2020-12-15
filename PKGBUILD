# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-appindicator
_pkgname=remmina
epoch=1
pkgver=1.4.10
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
sha512sums=('ebd589b4237c59b11ac0ca349654177752f11ca221afa761247a1f49c6224c1e7cb51db40b87233ab2a724fb0ef76162db0d7c743becd41a2b8524eafe108f7f')

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
