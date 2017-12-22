# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-user-accounts-git
pkgver=r349.051bb8e
pkgrel=1
pkgdesc='Switchboard User Accounts Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-useraccounts'
license=('GPL3')
groups=('pantheon-unstable')
depends=('accountsservice' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gnome-desktop' 'gtk3' 'libgee' 'libpwquality' 'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'granite-git'
             'switchboard-git' 'vala')
source=("switchboard-plug-user-accounts::git+https://github.com/elementary/switchboard-plug-useraccounts.git")
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-user-accounts

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-user-accounts

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-user-accounts/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-user-accounts/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
