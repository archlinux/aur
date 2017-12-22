# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-keyboard-git
pkgver=r99.7e9d9ee
pkgrel=1
pkgdesc='Keyboard indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libxml2'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-keyboard')
conflicts=('wingpanel-indicator-keyboard')
source=("git+https://github.com/elementary/wingpanel-indicator-keyboard.git")
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-keyboard

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-keyboard

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-keyboard/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-keyboard/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
