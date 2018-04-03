# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-keyboard-git
pkgver=r171.b294f01
pkgrel=1
pkgdesc='Keyboard indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libxml2'
         'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-keyboard')
conflicts=('wingpanel-indicator-keyboard')
source=("git+https://github.com/elementary/wingpanel-indicator-keyboard.git")
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-keyboard

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

  arch-meson ../wingpanel-indicator-keyboard
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
