# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime-git
pkgver=r350.1b77520
pkgrel=1
pkgdesc='Switchboard Date & Time Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-datetime')
conflicts=('switchboard-plug-datetime')
source=('git+https://github.com/elementary/switchboard-plug-datetime.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-datetime

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

  arch-meson ../switchboard-plug-datetime
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
