# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-online-accounts
pkgver=0.3
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
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-onlineaccounts/loki/${pkgver}/+download/switchboard-plug-onlineaccounts-${pkgver}.tar.xz")
sha256sums=('76864fedb90b60239aabc51cde494b7ae8d1a1f8b966e1d4d0a2ba1e1065c0b6')

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
