# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=slingshot-launcher
pkgver=0.7.6.1
pkgrel=1
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon')
depends=('gnome-menus2' 'granite' 'libgee06' 'libunity' 'libwnck3'
         'libzeitgeist')
makedepends=('cmake' 'vala')
install='slingshot-launcher.install'
source=("https://launchpad.net/slingshot/0.x/${pkgver}/+download/slingshot-launcher-${pkgver}.tgz")
sha256sums=('fa7766281b323e0f86db64afc24d0fd9e8765773da54eb703aaa507cddc0ebcb')

build() {
  cd slingshot-launcher-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_EXE_LINKER_FLAGS='-lm' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd slingshot-launcher-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
