# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about
pkgver=0.2.4
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
sha256sums=('0b5607514a9c2edb1741eb81af23a84dbd29bf2e5f4cba8bd6da08172a31d301')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard-plug-about-${pkgver} \
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
