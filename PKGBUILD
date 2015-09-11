# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-display
pkgver=0.1.1
pkgrel=1
pkgdesc='Display plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-display'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'clutter' 'clutter-gtk' 'glib2' 'glibc' 'gnome-desktop' 'gtk3'
         'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-display/${pkgver%.*.*}.x/${pkgver}/+download/switchboard-plug-display-${pkgver}.tar.xz")
sha256sums=('eca745a851b83bed5547700d8e1edf5a637b93b1047615647236723464cade56')

prepare() {
  cd switchboard-plug-display-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-display-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-display-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
