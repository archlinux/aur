# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about
pkgver=0.2.3
pkgrel=1
pkgdesc='Switchboard About Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-about'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("switchboard-plug-about-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-about/archive/${pkgver}.tar.gz")
sha256sums=('656726dc16406cffc4112581e48470005d03c124d70d439ea8c15b283cce5873')

prepare() {
  cd switchboard-plug-about-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-about-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-about-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
