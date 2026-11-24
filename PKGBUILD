# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-git
pkgver=4.1.0.r17.g9b5bec1
pkgrel=1
pkgdesc="A window manager designed for speed, usability, and consistency"
arch=(x86_64 i686)
url="https://github.com/bbidulock/icewm"
license=(LGPL-2.0-only)
depends=(
  alsa-lib
  fribidi
  glibc
  imlib2
  libgcc
  libice
  #libjpeg-turbo
  libsm
  libsndfile
  libstdc++
  libx11
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxft
  libxinerama
  #libxpm
  libxrandr
  libxrender
  perl
  sh
  )
makedepends=(
  asciidoctor
  git
  xorg-mkfontdir
  )
optdepends=('icewm-extra-themes: extra themes')
provides=(icewm icewm2)
conflicts=(icewm icewm2)
source=("git+https://github.com/bbidulock/icewm.git")
sha256sums=('SKIP')

pkgver() {
  cd icewm
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd icewm
  ./autogen.sh
}

build() {
  cd icewm
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make
}

package() {
  cd icewm
  make DESTDIR="${pkgdir}" install
}

# vim: sw=2 et:

