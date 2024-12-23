# Maintainer: <mumei6102@gmail.com>
# Original maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Original maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfdesktop
pkgname=$_pkgname-z166
pkgver=4.20.0
pkgrel=1
pkgdesc="Xfce's desktop manager with icon placement modification."
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
provides=('xfdesktop')
conflicts=('xfdesktop')
depends=('libxfce4ui' 'libxfce4windowing' 'libwnck3' 'libyaml' 'gtk-layer-shell' 'exo' 'thunar' 'garcon' 'hicolor-icon-theme')
makedepends=('git' 'glib2-devel' 'intltool' 'xfce4-dev-tools' 'patch')
source=("git+https://gitlab.xfce.org/xfce/xfdesktop.git#tag=$_pkgname-$pkgver"
        "xfdesktop-no-scramble-v2.diff")
sha256sums=('773b31c89fa822944979379c45724db50c167cd3110736a0cf4f12fb9b230c00'
            'bfee6b13b5ead0fb2b4d166bf1b2553ee0d3fd97cfbed899ab39dfa2bf9214a3')

prepare() {
  cd $_pkgname
  patch -p1 < ../xfdesktop-no-scramble-v2.diff
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-thunarx \
    --enable-x11 \
    --enable-wayland \
    --enable-notifications \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
