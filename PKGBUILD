# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-lastfm-bzr
pkgver=r7
pkgrel=1
pkgdesc='LastFM plugin for gSSO'
arch=('i686' 'x86_64')
url='https://launchpad.net/gsignond-plugin-lastfm'
license=('GPL3')
depends=('switchboard-plug-online-accounts-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('gsignond-plugin-lastfm')
conflicts=('gsignond-plugin-lastfm')
install='gsignond-plugin-lastfm.install'
source=('bzr+lp:gsignond-plugin-lastfm')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-lastfm

  echo "r$(bzr revno)"
}

build() {
  cd gsignond-plugin-lastfm

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd gsignond-plugin-lastfm/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
