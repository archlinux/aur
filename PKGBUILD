# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop
pkgver=0.2.4
pkgrel=1
pkgdesc='Desktop plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-desktop'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'plank'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-pantheon-shell/loki/${pkgver}/+download/switchboard-plug-pantheon-shell-${pkgver}.tar.xz")
sha256sums=('41813ffe47f58d95236685e10d7f2ba2ec717c1227366e86a1cc42662c895761')

prepare() {
  cd switchboard-plug-pantheon-shell-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-pantheon-shell-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-pantheon-shell-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
