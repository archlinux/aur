# Maintainer: mintsuki <mintsuki@protonmail.com>

pkgname=xfwm4-gaps
pkgver=4.20.0
pkgrel=2
pkgdesc="Xfce's window manager - now with extra gaps"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfwm4/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('git' 'xfce4-dev-tools')
provides=('xfwm4')
conflicts=('xfwm4')
source=("git+https://gitlab.xfce.org/xfce/xfwm4.git#tag=xfwm4-$pkgver"
        gaps.patch)
sha256sums=('68691593f06659f1ba1a0363be161b2cd50a84016612394c909bce1485a75cff'
            SKIP)

prepare() {
  cd xfwm4
  patch -Np1 -i ../gaps.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd xfwm4
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd xfwm4
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
