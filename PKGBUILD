# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-sharing
pkgver=0.1.1
pkgrel=1
pkgdesc='Sharing plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-sharing'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gnome-user-share' 'gtk3' 'libgee'
         'wingpanel-indicator-bluetooth'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-sharing/loki/${pkgver}/+download/switchboard-plug-sharing-${pkgver}.tar.xz")
sha256sums=('c317f6ff9f674325d561271ccb24a9c6bafc628f4ada8bee3abd49ca29e0e268')

prepare() {
  cd switchboard-plug-sharing-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-sharing-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-sharing-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
