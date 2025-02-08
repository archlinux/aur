# Maintainer: <mumei6102@gmail.com>
# Original maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Original maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-z166
pkgver=4.20.0
pkgrel=2
pkgdesc="Xfce's window manager (with few fixes)"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfwm4/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
provides=('xfwm4')
conflicts=('xfwm4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('git' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/xfce/xfwm4.git#tag=$_pkgname-$pkgver")
sha256sums=('68691593f06659f1ba1a0363be161b2cd50a84016612394c909bce1485a75cff')

prepare() {
  cd $_pkgname
  git cherry-pick -n 69a16352c9b0b6591099f63a306238272db58b3a
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
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
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
