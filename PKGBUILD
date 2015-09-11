# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-keyboard
pkgver=0.2.1
pkgrel=1
pkgdesc='Keyboard plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-keyboard'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-keyboard/freya/${pkgver}/+download/switchboard-plug-keyboard-${pkgver}.tgz")
sha256sums=('65c757b773d68008bc1229f7698064f91752ad591d37bcfbd44aa65fc8910553')

prepare() {
  cd switchboard-plug-keyboard-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-keyboard-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-keyboard-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
