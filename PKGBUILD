# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-online-accounts-git
pkgver=r446.5a0270a
pkgrel=1
pkgdesc='Switchboard Online Accounts Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-onlineaccounts'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gsignond-extension-pantheon-bzr'
         'gsignond-plugin-oauth-git' 'gsignond-plugin-sasl-git' 'gtk3'
         'json-glib' 'libaccounts-glib' 'libgee' 'libgsignon-glib' 'rest'
         'webkit2gtk'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-online-accounts')
conflicts=('switchboard-plug-online-accounts')
source=('switchboard-plug-online-accounts::git+https://github.com/elementary/switchboard-plug-onlineaccounts.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-online-accounts

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-online-accounts

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-online-accounts/build

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
