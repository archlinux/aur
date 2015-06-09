# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dserban <dserban01@yahoo.com>

pkgname=switchboard
pkgver=2.0.0
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard'
license=('GPL3')
groups=('pantheon')
depends=('clutter-gtk' 'granite-bzr')
makedepends=('bzr' 'cmake' 'vala')
optdepends=('switchboard-plug-about: About plug'
            'switchboard-plug-default-applications-bzr: Default applications plug'
            'switchboard-plug-elementary-tweaks-bzr: Elementary tweaks plug'
            'switchboard-plug-keyboard-bzr: Keyboard plug'
            'switchboard-plug-pantheon-shell-bzr: Pantheon Shell plug'
            'switchboard-plug-power-bzr: Power plug')
install='switchboard.install'
source=("https://launchpad.net/switchboard/${pkgver%%.*}.x/${pkgver%.*}/+download/switchboard-${pkgver}.tgz")
sha256sums=('4439af2019cda29e6267df2c0dabdaeba129808b0da14b632dcda8713dabb12e')

build() {
  cd switchboard-${pkgver}

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
  cd switchboard-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
