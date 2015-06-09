# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=wingpanel-indicator-slingshot-bzr
pkgver=r531
pkgrel=1
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon')
depends=('gala-bzr' 'gnome-menus' 'granite-bzr' 'wingpanel-rewrite-x11-bzr'
         'zeitgeist')
makedepends=('bzr' 'cmake' 'vala')
provides=('slingshot-launcher' 'slingshot-launcher-bzr')
conflicts=('slingshot-launcher' 'slingshot-launhcer-bzr')
install='wingpanel-indicator-slingshot.install'
source=('wingpanel-indicator-slingshot::bzr+lp:~wingpanel-devs/slingshot/wingpanel-indicator')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-slingshot

  echo "r$(bzr revno)"
}

build() {
  cd wingpanel-indicator-slingshot

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make -j1
}

package() {
  cd wingpanel-indicator-slingshot/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
