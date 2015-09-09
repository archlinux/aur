# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about-bzr
pkgver=r321
pkgrel=1
pkgdesc='About plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-about'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-about')
conflicts=('switchboard-plug-about')
source=('bzr+lp:switchboard-plug-about'
        'about-archlinux.patch')
sha256sums=('SKIP'
            '792efaed1c32a03f058581887fe8fb48e53a9edadc66a0addd5ffbc7c288ad65')

pkgver() {
  cd switchboard-plug-about

  echo "r$(bzr revno)"
}

prepare() {
  cd switchboard-plug-about

  patch -Np1 -i ../about-archlinux.patch
}

build() {
  cd switchboard-plug-about

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
  cd switchboard-plug-about/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
