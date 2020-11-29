# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-camera-git
pkgver=1.0.6.r91.gf856989
pkgrel=1
pkgdesc="The Pantheon Camera Application"
arch=(x86_64)
url="https://github.com/elementary/camera"
license=(GPL3)
groups=(pantheon-unstable)
depends=(clutter clutter-gst clutter-gtk gstreamer
         gtk3 libcanberra libgranite.so libhandy)
makedepends=(git granite intltool meson vala appstream)
provides=(pantheon-camera)
conflicts=(pantheon-camera)
source=("pantheon-camera::git+https://github.com/elementary/camera.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname%-git}/build"

  arch-meson ..
  ninja
}

package() {
  cd "${pkgname%-git}/build"

  DESTDIR="${pkgdir}" ninja install
}
