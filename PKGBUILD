# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-pantheon-shell-bzr
pkgver=r336
pkgrel=1
pkgdesc='Pantheon Shell plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-pantheon-shell'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gnome-desktop' 'plank' 'switchboard-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-pantheon-shell')
conflicts=('switchboard-plug-pantheon-shell')
source=('bzr+lp:switchboard-plug-pantheon-shell'
        'pantheon-shell-paths.patch')
sha256sums=('SKIP'
            '085777b30998596e521c83e0676687b6ca3e73f04d0f1a62c673f4a78b29c933')

pkgver() {
  cd switchboard-plug-pantheon-shell

  echo "r$(bzr revno)"
}

prepare() {
  cd switchboard-plug-pantheon-shell

  patch -Np1 -i ../pantheon-shell-paths.patch
}

build() {
  cd switchboard-plug-pantheon-shell

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
  cd switchboard-plug-pantheon-shell/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
