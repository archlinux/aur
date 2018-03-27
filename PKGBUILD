# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers-git
pkgver=r237.8051a03
pkgrel=1
pkgdesc='Switchboard Printers Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libcups' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-printers')
conflicts=('switchboard-plug-printers')
source=('git+https://github.com/elementary/switchboard-plug-printers.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-printers

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

  arch-meson ../switchboard-plug-printers
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
