# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound-git
pkgver=2.1.6.r2.g7582e6d
pkgrel=1
pkgdesc='Sound indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'gtk3' 'libcanberra'
         'libgee' 'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('git' 'gobject-introspection' 'granite-git' 'gtk2' 'meson' 'vala'
             'wingpanel')
provides=('wingpanel-indicator-sound')
conflicts=('wingpanel-indicator-sound')
source=('git+https://github.com/elementary/wingpanel-indicator-sound.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-sound

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../wingpanel-indicator-sound
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
