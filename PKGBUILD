# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop
pkgver=0.2.6
pkgrel=2
pkgdesc='Switchboard Desktop Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-pantheon-shell'
license=('GPL3')
groups=('pantheon')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee' 'plank'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("switchboard-plug-desktop-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-pantheon-shell/archive/${pkgver}.tar.gz")
sha256sums=('857b7996573ede801b297c2dc6beb3b86b37e985a90f151475ea1683259ff5c4')

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
