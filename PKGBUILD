# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-mouse-touchpad-git
pkgver=r270.4ad3983
pkgrel=1
pkgdesc='Switchboard Mouse & Touchpad Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-mouse-touchpad'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-mouse-touchpad')
conflicts=('switchboard-plug-mouse-touchpad')
source=('git+https://github.com/elementary/switchboard-plug-mouse-touchpad.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-mouse-touchpad

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

  arch-meson ../switchboard-plug-mouse-touchpad
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
