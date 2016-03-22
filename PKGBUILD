# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-a11y-bzr
pkgver=r44
pkgrel=2
pkgdesc='Accessibility plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'granite' 'switchboard')
makedepends=('bzr' 'cmake' 'vala')
optdepends=('onboard: On-screen keyboard')
provides=('switchboard-plug-a11y')
conflicts=('switchboard-plug-a11y')
source=('bzr+lp:switchboard-plug-a11y')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-a11y

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-a11y

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
  cd switchboard-plug-a11y/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
