# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-git
pkgver=1.3.12.173
pkgrel=1
pkgdesc="A window manager designed for speed, usability, and consistency"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/icewm"
license=('LGPL')
provides=('icewm' 'icewm2')
conflicts=('icewm' 'icewm2' 'icwm-cvs' 'icwm-ak' 'icwm-init0' 'icwm-testing' 'icwm-zstegi')
depends=('libxft' 'libxinerama' 'gdk-pixbuf2' 'libxrandr' 'libsndfile' 'libsm' 'fribidi')
makedepends=('git' 'xorg-mkfontdir' 'linuxdoc-tools')
source=("$pkgname::git+https://github.com/bbidulock/icewm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's|^[^0-9]*||;s|[-_]|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-shaped-decorations --enable-gradients \
    --enable-guievents --with-icesound=ALSA,OSS \
    --disable-menus-gnome2 \
    EXTRA_LIBS="/usr/lib/libsupc++.a"
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: sw=2 et:

