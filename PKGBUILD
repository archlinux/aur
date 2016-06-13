# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=0.4
pkgrel=1
pkgdesc='The Pantheon Top Panel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon')
depends=('clutter' 'cogl' 'glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
optdepends=('indicator-datetime: Display date and time'
            'indicator-pantheon-session-bzr: Pantheon session indicator'
            'indicator-power: Battery idicator')
makedepends=('cmake' 'vala')
provides=('libwingpanel-2.0.so')
source=("https://launchpad.net/wingpanel/0.4.x/loki-alpha1/+download/wingpanel-${pkgver}.tar.xz")
sha256sums=('3ba1bcb01965b037047c88e9b4308340240f37d6f1f5f98a47019d08f8e0e82b')

prepare() {
  cd wingpanel-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
