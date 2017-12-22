# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-terminal-git
pkgver=r1373.d718aa1
pkgrel=1
pkgdesc='The Pantheon Terminal Emulator'
arch=('x86_64')
url='https://github.com/elementary/terminal'
license=('GPL3')
groups=('pantheon-unstable')
depends=('desktop-file-utils' 'glib2' 'glibc' 'gtk3' 'libnotify' 'pango' 'vte3'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('pantheon-terminal')
conflicts=('pantheon-terminal')
replaces=('pantheon-terminal-bzr')
source=('pantheon-terminal::git+https://github.com/elementary/terminal.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-terminal

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-terminal

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-terminal/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-terminal/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
