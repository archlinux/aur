# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dserban <dserban01@yahoo.com>

pkgname=switchboard-bzr
pkgver=r566
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
optdepends=('switchboard-plug-about-bzr: About plug'
            'switchboard-plug-default-applications-bzr: Default applications plug'
            'switchboard-plug-elementary-tweaks-bzr: Elementary tweaks plug'
            'switchboard-plug-keyboard-bzr: Keyboard plug'
            'switchboard-plug-pantheon-shell-bzr: Pantheon Shell plug'
            'switchboard-plug-power-bzr: Power plug')
provides=('switchboard' 'libswitchboard-2.0.so')
conflicts=('switchboard')
install='switchboard.install'
source=('bzr+lp:switchboard')
sha256sums=('SKIP')

pkgver() {
  cd switchboard

  echo "r$(bzr revno)"
}

build() {
  cd switchboard

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
  make
}

package() {
  cd switchboard/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
