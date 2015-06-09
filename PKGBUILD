# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about
pkgver=0.1.2
pkgrel=2
pkgdesc='About plug for Switchboard'
arch=('i686' 'x86_64')
url="https://launchpad.net/${pkgname}"
license=('GPL3')
depends=('libpantheon' 'switchboard')
makedepends=('cmake' 'vala')
source=("${url}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tgz"
        'about-archlinux.patch')
sha256sums=('1ced8c11b285ac6210121f7edd115958f07a49ef4de365793f2517aade408a04'
            '2c68f1307b939a19a1cccebf75af387c32dfe68cf95f97ed6174fc29c56a2462')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -Np1 -i ../about-archlinux.patch
}

build() {
  cd ${pkgname}-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd ${pkgname}-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
