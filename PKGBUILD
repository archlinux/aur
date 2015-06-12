# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Erasmo Marín <https://launchpad.net/~erasmo-marin>

pkgname=wingpanel-globalmenu-bzr
pkgver=r217
pkgrel=1
pkgdesc='The Pantheon Panel with globalmenu support'
arch=('i686' 'x86_64')
url='https://code.launchpad.net/~erasmo-marin/+junk/wingpanel-globalmenu'
license=('GPL3')
depends=('granite-bzr' 'ido' 'libindicator-gtk3' 'libwnck3')
optdepends=('indicator-datetime: Display date and time'
            'indicator-pantheon-session-bzr: Pantheon session indicator'
            'indicator-power: Battery idicator')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel')
conflicts=('wingpanel')
install='wingpanel-globalmenu.install'
source=('bzr+lp:~erasmo-marin/+junk/wingpanel-globalmenu')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

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
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et: