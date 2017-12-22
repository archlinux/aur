# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-display-git
pkgver=r214.0e44078
pkgrel=1
pkgdesc=' Switchboard Displays Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-display'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-display')
conflicts=('switchboard-plug-display')
replaces=('switchboard-plug-display-bzr')
source=('git+https://github.com/elementary/switchboard-plug-display.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-display

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-display

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-display/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-display/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
