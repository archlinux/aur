# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-online-accounts-bzr
pkgver=r205
pkgrel=1
pkgdesc='Online Accounts plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-onlineaccounts'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gsignond-extension-pantheon-bzr'
         'gsignond-plugin-oauth-git' 'gsignond-plugin-sasl-git' 'gtk3'
         'json-glib' 'libaccounts-glib' 'libgee' 'libgsignon-glib' 'rest'
         'webkit2gtk'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-online-accounts')
conflicts=('switchboard-plug-online-accounts')
install='switchboard-plug-online-accounts.install'
source=('switchboard-plug-online-accounts::bzr+lp:switchboard-plug-onlineaccounts')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-online-accounts

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-online-accounts

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
  cd switchboard-plug-online-accounts/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
