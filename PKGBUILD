# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-keyboard-git
pkgver=r850.9d478e5
pkgrel=1
pkgdesc='Switchboard Keyboard Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libgnomekbd' 'libxklavier' 'libxml2'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-keyboard')
conflicts=('switchboard-plug-keyboard')
source=('git+https://github.com/elementary/switchboard-plug-keyboard.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-keyboard

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

  arch-meson ../switchboard-plug-keyboard
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
