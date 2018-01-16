# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-git
pkgver=1.4.2.1048
pkgrel=1
pkgdesc="A window manager designed for speed, usability, and consistency"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/icewm"
license=('LGPL')
provides=('icewm' 'icewm2')
conflicts=('icewm' 'icewm2' 'icwm-cvs' 'icwm-ak' 'icwm-init0' 'icwm-testing' 'icwm-zstegi')
depends=('libxft' 'libxinerama' 'libxpm' 'libjpeg' 'libxrandr' 'libsndfile' 'fribidi')
makedepends=('git' 'xorg-mkfontdir' 'asciidoctor')
optdepends=('icewm-extra-themes: extra themes')
source=("$pkgname::git+https://github.com/bbidulock/icewm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's|^[^0-9]*||;s|[-_]|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: sw=2 et:

