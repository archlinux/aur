# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-desktop-bzr
pkgver=r529
pkgrel=1
pkgdesc='Desktop plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-pantheon-shell'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'plank'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'switchboard-bzr' 'vala')
replaces=('switchboard-plug-pantheon-shell-bzr')
provides=('switchboard-plug-desktop' 'switchboard-plug-pantheon-shell')
conflicts=('switchboard-plug-desktop' 'switchboard-plug-pantheon-shell')
source=('switchboard-plug-desktop::bzr+lp:switchboard-plug-pantheon-shell'
        'switchboard-plug-desktop-paths.patch')
sha256sums=('SKIP'
            '0c6df0421b9ce72f8c4b95f0102400c01125ab5d2515a580132104773b836331')

pkgver() {
  cd switchboard-plug-desktop

  echo "r$(bzr revno)"
}

prepare() {
  cd switchboard-plug-desktop

  patch -Np1 -i ../switchboard-plug-desktop-paths.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-desktop/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-desktop/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
