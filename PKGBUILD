# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-security-privacy-bzr
pkgver=r172
pkgrel=1
pkgdesc='Security & Privacy plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-security-privacy'
license=('GPL3')
depends=('elementary-dpms-helper-bzr' 'light-locker' 'switchboard-bzr' 'ufw'
         'zeitgeist')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-security-privacy')
conflicts=('switchboard-plug-security-privacy')
source=('bzr+lp:switchboard-plug-security-privacy')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-security-privacy

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-security-privacy

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
  cd switchboard-plug-security-privacy/build

  make DESTDIR="${pkgdir}" install

  chmod 755 "${pkgdir}"/usr/lib/switchboard/personal/pantheon-security-privacy/security-privacy-plug-helper
}

# vim: ts=2 sw=2 et:
