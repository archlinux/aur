# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-shortcut-overlay-git
pkgver=r217.bc242d1
pkgrel=1
pkgdesc='A native, OS-wide shortcut overlay'
arch=('x86_64')
url='https://github.com/elementary/shortcut-overlay'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so')
makedepends=('git' 'granite-git' 'meson' 'vala')
provides=('pantheon-shortcut-overlay')
conflicts=('pantheon-shortcut-overlay')
source=('pantheon-shortcut-overlay::git+https://github.com/elementary/shortcut-overlay.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-shortcut-overlay

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

  arch-meson ../pantheon-shortcut-overlay
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
