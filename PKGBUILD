# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=0.3.0.2
pkgrel=1
pkgdesc='The Pantheon Top Panel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon')
depends=('granite' 'libgee' 'libindicator-gtk3')
optdepends=('indicator-datetime: Display date and time'
            'indicator-pantheon-session-bzr: Pantheon session indicator'
            'indicator-power: Battery idicator')
makedepends=('cmake' 'vala')
install="wingpanel.install"
source=("https://launchpad.net/wingpanel/0.3.x/${pkgver}/+download/wingpanel-${pkgver}.tar.xz")
sha256sums=('c8efc810eb671f4e6736133216353eb8cd7b23ed4001a8c3a8e8e2a7aa5d4dec')

build() {
  cd wingpanel-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DNO_INDICATOR_NG='TRUE' \
    -DOLD_LIB_IDO='TRUE'
  make
}

package() {
  cd wingpanel-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
