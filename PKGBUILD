# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-mouse-touchpad-git
pkgver=r209.2de4d44
pkgrel=1
pkgdesc='Switchboard Mouse & Touchpad Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-mouse-touchpad'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-mouse-touchpad')
conflicts=('switchboard-plug-mouse-touchpad')
replaces=('switchboard-plug-mouse-touchpad-bzr')
source=('git+https://github.com/elementary/switchboard-plug-mouse-touchpad.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-mouse-touchpad

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-mouse-touchpad

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-mouse-touchpad/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-mouse-touchpad/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
