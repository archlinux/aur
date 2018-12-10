# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmyvideos-git
pkgver=1.1.2.r1.g618b4eb
pkgrel=1
pkgdesc="Cinema is a video player for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/cinema"
license=(GPL3)
depends=(libgranite.so gtk3 clutter-gtk clutter-gst gst-plugins-base sqlite)
makedepends=(cmake vala git)
provides=(playmyvideos)
conflicts=(playmyvideos)
source=("${pkgname}::git+https://github.com/artemanufrij/playmyvideos.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
