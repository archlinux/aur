# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-terminal-git
pkgver=r1763.87a4849
pkgrel=1
pkgdesc='The Pantheon Terminal Emulator'
arch=('x86_64')
url='https://github.com/elementary/terminal'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'gtk3' 'libnotify' 'pango' 'vte3'
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

build() {
  arch-meson pantheon-terminal build \
    -Dubuntu-bionic-patched-vte='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
