# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-camera-git
pkgver=r547.3494a05
pkgrel=1
pkgdesc='The Pantheon Camera Application'
arch=('x86_64')
url='https://github.com/elementary/camera'
license=('GPL3')
groups=('pantheon-unstable')
depends=('appstream' 'clutter' 'clutter-gst' 'clutter-gtk' 'glib2' 'glibc'
         'gstreamer' 'gtk3' 'libcanberra'
         'libgranite.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala')
provides=('pantheon-camera')
conflicts=('pantheon-camera')
source=('pantheon-camera::git+https://github.com/elementary/camera.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-camera

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../pantheon-camera
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
