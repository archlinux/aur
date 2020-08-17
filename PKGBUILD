# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-terminal-git
pkgver=5.5.2.r80.g0bb980e0
pkgrel=1
pkgdesc='The Pantheon Terminal Emulator'
arch=('x86_64')
url='https://github.com/elementary/terminal'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'gtk3' 'libnotify' 'pango' 'vte3'
         'libgranite.so' 'libhandy-1.so')
makedepends=('appstream' 'git' 'granite' 'intltool' 'meson' 'vala' 'libhandy1')
provides=('pantheon-terminal')
conflicts=('pantheon-terminal')
source=('pantheon-terminal::git+https://github.com/elementary/terminal.git'
        '0001-libhandy1-support.patch')
sha256sums=('SKIP'
            'ff08cdcbc3a16f99e65814abb8d933b43a75161250e0140792cf27f476e1741c')

pkgver() {
  cd pantheon-terminal

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd pantheon-terminal
  patch -Np1 -i ../0001-libhandy1-support.patch
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
