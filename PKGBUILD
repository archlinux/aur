# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=wingpanel-rewrite-x11-bzr
pkgver=r77
pkgrel=1
pkgdesc='The Pantheon Panel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gala-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel' 'wingpanel-bzr')
conflicts=('wingpanel' 'wingpanel-bzr')
install='wingpanel.install'
source=('bzr+lp:~wingpanel-devs/wingpanel/wingpanel-rewrite-x11'
        'wingpanel-fixes.patch')
sha256sums=('SKIP'
            '6f5101f8575a612f8e6c6b21ee9323c82ca1ec5c90fc1abf12a8f29ab2733fd7')

pkgver() {
  cd wingpanel-rewrite-x11

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-rewrite-x11

  patch -Np1 -i ../wingpanel-fixes.patch
}

build() {
  cd wingpanel-rewrite-x11

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-rewrite-x11/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
