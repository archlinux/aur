# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-sharing-git
pkgver=r200.23bb1e3
pkgrel=1
pkgdesc='Switchboard Sharing Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-sharing'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-sharing')
conflicts=('switchboard-plug-sharing')
source=('git+https://github.com/elementary/switchboard-plug-sharing.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-sharing

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

  arch-meson ../switchboard-plug-sharing
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
