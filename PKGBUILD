# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-videos-git
pkgver=r1246.715b8c6
pkgrel=1
pkgdesc='The Pantheon Video Player'
arch=('x86_64')
url='https://github.com/elementary/videos'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter' 'clutter-gst' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'libgee' 'libx11'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('audience' 'pantheon-videos')
conflicts=('audience')
replaces=('audience-bzr')
source=('pantheon-videos::git+https://github.com/elementary/videos.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-videos

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-videos

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-videos/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd pantheon-videos/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
