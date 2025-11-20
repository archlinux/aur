# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-git
pkgver=3.9.0.r56.gd0bf414
pkgrel=1
pkgdesc="A window manager designed for speed, usability, and consistency"
arch=(x86_64 i686)
url="https://github.com/bbidulock/icewm"
license=(LGPL-2.0-only)
provides=(icewm icewm2)
conflicts=(icewm icewm2)
depends=(libxft libxinerama libxpm libjpeg libxrandr libsndfile fribidi libxcomposite libxcursor libxdamage libxfixes imlib2)
makedepends=(git xorg-mkfontdir asciidoctor)
optdepends=('icewm-extra-themes: extra themes')
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

