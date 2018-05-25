# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-videos-git
pkgver=r1325.b0e05b8
pkgrel=1
pkgdesc='The Pantheon Video Player'
arch=('x86_64')
url='https://github.com/elementary/videos'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter' 'clutter-gst' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'libgee' 'libx11'
         'libgranite.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala')
provides=('pantheon-videos')
conflicts=('pantheon-videos')
source=('pantheon-videos::git+https://github.com/elementary/videos.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-videos

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

  arch-meson ../pantheon-videos
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
