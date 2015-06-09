# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=slingshot-launcher-bzr
pkgver=r407
pkgrel=1
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon')
depends=('gala-bzr' 'gnome-menus' 'granite' 'zeitgeist')
makedepends=('bzr' 'cmake' 'vala')
provides=('slingshot-launcher')
conflicts=('slingshot-launcher')
install='slingshot-launcher.install'
source=('slingshot-launcher::bzr+lp:slingshot')
sha256sums=('SKIP')

pkgver() {
  cd slingshot-launcher

  echo "r$(bzr revno)"
}

build() {
  cd slingshot-launcher

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd slingshot-launcher/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
