# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-terminal-git
pkgver=r1638.25f359a
pkgrel=1
pkgdesc='The Pantheon Terminal Emulator'
arch=('x86_64')
url='https://github.com/elementary/terminal'
license=('GPL3')
groups=('pantheon-unstable')
depends=('desktop-file-utils' 'glib2' 'glibc' 'gtk3' 'libnotify' 'pango' 'vte3'
         'libgranite.so')
makedepends=('appstream' 'git' 'granite-git' 'intltool' 'meson' 'vala')
provides=('pantheon-terminal')
conflicts=('pantheon-terminal')
source=('pantheon-terminal::git+https://github.com/elementary/terminal.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-terminal

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

  arch-meson ../pantheon-terminal
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
