# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=wingpanel-bzr
pkgver=r93
pkgrel=1
epoch=1
pkgdesc='The Pantheon Panel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter' 'cogl' 'glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel' 'libwingpanel-2.0.so')
conflicts=('wingpanel')
install='wingpanel.install'
source=('wingpanel::bzr+lp:wingpanel/0.4.x'
        'wingpanel-fixes.patch')
sha256sums=('SKIP'
            '6f5101f8575a612f8e6c6b21ee9323c82ca1ec5c90fc1abf12a8f29ab2733fd7')

pkgver() {
  cd wingpanel

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel

  patch -Np1 -i ../wingpanel-fixes.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
