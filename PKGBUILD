# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-videos-git
pkgver=2.7.2.r56.gc8e46215
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

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-videos build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
