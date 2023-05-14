# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=playmyvideos-git
pkgver=1.1.2.r26.g5aef166
pkgrel=2
pkgdesc="Cinema is a video player for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/cinema"
license=(GPL3)
depends=(libgranite.so gtk3 clutter-gtk clutter-gst gst-plugins-base sqlite libsoup)
makedepends=(meson vala git)
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
  ln -s /usr/bin/com.github.artemanufrij.playmyvideos "$pkgdir/usr/bin/playmyvideos"
}
