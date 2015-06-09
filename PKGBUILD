# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=wingpanel-indicator-launcher-bzr
pkgver=r2
pkgrel=3
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon')
depends=('gala-bzr' 'slingshot-launcher-bzr' 'gnome-menus' 'granite-bzr' 'wingpanel-rewrite-x11-bzr'
         'zeitgeist')
makedepends=('bzr' 'cmake' 'vala')
install='wingpanel-indicator-launcher.install'
source=('wingpanel-indicator-launcher::bzr+lp:~parnold-x/+junk/wingpanel-indicator-launcher')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-launcher

  echo "r$(bzr revno)"
}

build() {
  cd wingpanel-indicator-launcher

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make -j1
}

package() {
  cd wingpanel-indicator-launcher/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
