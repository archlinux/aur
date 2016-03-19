# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=appcenter-bzr
pkgver=r153
pkgrel=2
pkgdesc='The indie, open, pay-what-you-want app store'
arch=('i686' 'x86_64')
url='https://launchpad.net/appcenter'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'packagekit' 'appstream-glib' 'appstream' 'archlinux-appstream-data'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala' 'cmake-elementary-bzr')
provides=('appcenter')
conflicts=('appcenter')
install='appcenter.install'
source=('bzr+lp:appcenter')
sha256sums=('SKIP')

pkgver() {
  cd appcenter

  echo "r$(bzr revno)"
}

build() {
  cd appcenter

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd appcenter/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
