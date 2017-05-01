# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound-git
pkgver=r198.b4ec8a1
pkgrel=1
pkgdesc='Sound indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee'
         'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'granite-git' 'gtk2' 'vala'
             'wingpanel-git')
provides=('wingpanel-indicator-sound')
conflicts=('wingpanel-indicator-sound')
replaces=('wingpanel-indicator-cound-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-sound.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-sound

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-sound

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-sound/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd wingpanel-indicator-sound/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
