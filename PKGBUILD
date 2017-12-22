# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-camera-git
pkgver=r496.d040b1a
pkgrel=1
pkgdesc='The Pantheon Camera Application'
arch=('x86_64')
url='https://github.com/elementary/camera'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter' 'clutter-gst' 'clutter-gtk' 'glib2' 'glibc' 'gstreamer'
         'gtk3' 'libcanberra'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('pantheon-camera')
conflicts=('pantheon-camera' 'snap-photobooth')
replaces=('snap-photobooth-bzr')
source=('pantheon-camera::git+https://github.com/elementary/camera.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-camera

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-camera

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-camera/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-camera/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
