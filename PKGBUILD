# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop-git
pkgver=r870.5b0826a
pkgrel=1
pkgdesc='Switchboard Desktop Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-pantheon-shell'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'libgexiv2' 'plank'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'libgexiv2' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-desktop')
conflicts=('switchboard-plug-desktop')
source=('switchboard-plug-desktop::git+https://github.com/elementary/switchboard-plug-pantheon-shell.git'
        'switchboard-plug-desktop-paths.patch')
sha256sums=('SKIP'
            '75353594da255ecc16b277e65f7a2bdc1a0aef17e6ab30a0be7b8636d60379c5')

pkgver() {
  cd switchboard-plug-desktop

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  cd switchboard-plug-desktop

  patch -Np1 -i ../switchboard-plug-desktop-paths.patch
}

build() {
  cd build

  arch-meson ../switchboard-plug-desktop
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
