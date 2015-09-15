# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=slingshot-launcher
pkgver=0.8.1.1
pkgrel=1
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus' 'gtk3' 'json-glib'
         'libgee' 'libsoup' 'plank' 'zeitgeist'
         'libgranite.so')
makedepends=('cmake' 'vala')
install='slingshot-launcher.install'
source=("https://launchpad.net/slingshot/freya/${pkgver}/+download/slingshot-launcher-${pkgver}.tar.xz")
sha256sums=('bc72aa2ba427d7d24a5baa6ea932ba34afe7ecdcda16b9a64be788bef1f11e6e')

prepare() {
  cd slingshot-launcher-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd slingshot-launcher-${pkgver}/build

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
