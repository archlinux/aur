# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-locale-bzr
pkgver=r155
pkgrel=1
pkgdesc='Locale plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-locale'
license=('GPL3')
depends=('accountsservice' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'ibus'
         'libgee' 'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-locale')
conflicts=('switchboard-plug-locale')
install='switchboard-plug-locale.install'
source=('bzr+lp:switchboard-plug-locale')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-locale

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-locale

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-locale/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
