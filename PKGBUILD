# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-terminal-git
pkgver=r1696.3f84363
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
source=('pantheon-terminal::git+https://github.com/elementary/terminal.git'
        'pantheon-terminal-vte0.52.patch')
sha256sums=('SKIP'
            'af30fd1c7685ed46a708b988a8844ec1bdb30ef2727a05160dfa0384b5bb76e1')

pkgver() {
  cd pantheon-terminal

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  cd pantheon-terminal

  patch -Np1 -i ../pantheon-terminal-vte0.52.patch
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
