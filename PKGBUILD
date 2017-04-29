# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-online-accounts
pkgver=0.3.0.1
pkgrel=1
pkgdesc='Online Accounts plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-onlineaccounts'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gsignond-extension-pantheon-bzr'
         'gsignond-plugin-oauth-git' 'gsignond-plugin-sasl-git' 'gtk3'
         'json-glib' 'libaccounts-glib' 'libgee' 'libgsignon-glib' 'rest'
         'webkit2gtk'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("https://launchpad.net/switchboard-plug-onlineaccounts/loki/${pkgver}/+download/switchboard-plug-onlineaccounts-${pkgver}.tar.xz")
sha256sums=('ac7fdaebdab65403fd7e2776d381a0e205bc131a5acf6d29420b2dbaae3680a9')

prepare() {
  cd switchboard-plug-onlineaccounts-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-onlineaccounts-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-onlineaccounts-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
