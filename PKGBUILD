# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-git
pkgver=1.3.8.33
pkgrel=1
pkgdesc="A window manager designed for speed, usability, and consistency"
arch=('i686' 'x86_64')
url="http://icewm.org/"
license=('LGPL')
provides=('icewm')
conflicts=('icewm' 'icwm-cvs' 'icwm-ak' 'icwm-init0' 'icwm-testing' 'icwm-zstegi')
depends=('libxft' 'libxinerama' 'gdk-pixbuf2' 'libxrandr' 'libsndfile' 'libsm')
makedepends=('git' 'xorg-mkfontdir' 'linuxdoc-tools')
source=("$pkgname::git://github.com/bbidulock/icewm.git")
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
    --enable-guievents --with-icesound=ALSA,OSS
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: sw=2 et:

