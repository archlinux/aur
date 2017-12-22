# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cerbere
pkgver=0.2.1
pkgrel=1
pkgdesc='The Pantheon Watchdog'
arch=('x86_64')
url='https://launchpad.net/cerbere'
license=('GPL2')
groups=('pantheon')
depends=('dconf' 'libgee')
makedepends=('cmake' 'vala')
install='cerbere.install'
source=("https://launchpad.net/cerbere/${pkgver%%.*}.x/${pkgver}/+download/cerbere-${pkgver}.tgz")
sha256sums=('6d585290105558fe8adf1554228c8650aae1a0cec1457a2614d3c9d78a129606')

prepare() {
  cd cerbere-${pkgver}

  sed "s/'wingpanel','plank','slingshot-launcher --silent'/'gala','wingpanel','plank','slingshot-launcher --silent'/" -i org.pantheon.cerbere.gschema.xml
}

build() {
  cd cerbere-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd cerbere-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
