# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-elementary-tweaks-bzr
pkgver=r276
pkgrel=1
pkgdesc='Elementary Tweaks plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/elementary-tweaks'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gconf' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=(switchboard-plug-elementary-tweaks{,-bzr})
conflicts=('switchboard-plug-elementary-tweaks')
source=('switchboard-plug-elementary-tweaks::bzr+lp:elementary-tweaks'
        'opacity.patch')
sha256sums=('SKIP'
            'e9a73d0b7b57178b676e3c563db5559dc83469debadf83855a8639999cb370cc')

pkgver() {
  cd switchboard-plug-elementary-tweaks

  echo "r$(bzr revno)"
}

prepare() {
  patch -Np1 < opacity.patch
}

build() {
  cd switchboard-plug-elementary-tweaks

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
  cd switchboard-plug-elementary-tweaks/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
