# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-videos-git
pkgver=8.0.1.r1.g76674c2a
pkgrel=1
pkgdesc='The Pantheon Video Player'
arch=('x86_64')
url='https://github.com/elementary/videos'
license=('GPL-3.0-or-later')
groups=('pantheon-unstable')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gst-plugins-base-libs'
        'gstreamer' 'gtk4' 'libgee' 'libadwaita'
         'libgranite-7.so')
makedepends=('git' 'granite7' 'intltool' 'meson' 'vala')
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
