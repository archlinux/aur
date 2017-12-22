# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power-git
pkgver=r526.7331e01
pkgrel=1
pkgdesc='Switchboard Power Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-power'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gnome-settings-daemon' 'gtk3' 'libgee' 'polkit'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-power')
conflicts=('switchboard-plug-power')
replaces=('switchboard-plug-power-bzr')
source=('git+https://github.com/elementary/switchboard-plug-power.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-power

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-power

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-power/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-power/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
