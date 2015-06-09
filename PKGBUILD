# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cerbere-bzr
pkgver=r48
pkgrel=1
pkgdesc='The Pantheon Watchdog'
arch=('i686' 'x86_64')
url='https://launchpad.net/cerbere'
license=('GPL2')
groups=('pantheon-unstable')
depends=('dconf' 'libgee')
makedepends=('bzr' 'cmake' 'vala')
provides=('cerbere')
conflicts=('cerbere')
install='cerbere.install'
source=('bzr+lp:cerbere')
sha256sums=('SKIP')

pkgver() {
  cd cerbere

  echo "r$(bzr revno)"
}

prepare() {
  cd cerbere

  sed "s/'wingpanel','plank','slingshot-launcher --silent'/'gala','wingpanel','plank','slingshot-launcher --silent'/" -i org.pantheon.cerbere.gschema.xml
}

build() {
  cd cerbere

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
  cd cerbere/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
