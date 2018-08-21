# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-user-accounts
pkgver=0.1.6
pkgrel=1
pkgdesc='Switchboard User Accounts Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-useraccounts'
license=('GPL3')
groups=('pantheon')
depends=('accountsservice' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gnome-desktop' 'gtk3' 'libgee' 'libpwquality' 'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'switchboard' 'vala')
source=("switchboard-plug-user-accounts::git+https://github.com/elementary/switchboard-plug-useraccounts.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard-plug-user-accounts \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
