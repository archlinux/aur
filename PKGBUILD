# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-keyboard-git
pkgver=r761.4768b15
pkgrel=1
pkgdesc='Switchboard Keyboard Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libgnomekbd' 'libxklavier' 'libxml2'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-keyboard')
conflicts=('switchboard-plug-keyboard')
replaces=('switchboard-plug-keyboard-bzr')
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

  cmake ../switchboard-plug-keyboard \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
