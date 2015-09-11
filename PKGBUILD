# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power
pkgver=0.2.1
pkgrel=1
pkgdesc='Power plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-power'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-power/freya/${pkgver}/+download/switchboard-plug-power-${pkgver}.tar.xz")
sha256sums=('df325419fea1d0814a457196cad4cc41be0c551513c5eba71eaa2e5825e88b3d')

prepare() {
  cd switchboard-plug-power-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-power-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-power-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
