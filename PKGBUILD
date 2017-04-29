# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-applications
pkgver=0.1.2
pkgrel=1
pkgdesc='Applications plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("https://launchpad.net/switchboard-plug-applications/loki/${pkgver}/+download/switchboard-plug-applications-${pkgver}.tar.xz")
sha256sums=('d7bc53a01d31f0d00c2fc33cee93357d64065000cef7dd982784cf98efe997b4')

prepare() {
  cd switchboard-plug-applications-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-applications-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-applications-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
