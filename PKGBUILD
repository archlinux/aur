# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=wingpanel-bzr
pkgver=r218
pkgrel=1
pkgdesc='The Pantheon Panel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon-unstable')
depends=('granite-bzr' 'ido' 'libindicator-gtk3' 'libwnck3')
optdepends=('indicator-datetime: Display date and time'
            'indicator-pantheon-session-bzr: Pantheon session indicator'
            'indicator-power: Battery idicator')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel')
conflicts=('wingpanel')
install='wingpanel.install'
source=('bzr+lp:wingpanel')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel

  echo "r$(bzr revno)"
}

build() {
  cd wingpanel

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DNO_INDICATOR_NG='TRUE' \
    -DOLD_LIB_IDO='TRUE'
  make
}

package() {
  cd wingpanel/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
