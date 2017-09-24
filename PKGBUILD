# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-user-accounts
pkgver=0.1.5
pkgrel=1
pkgdesc='Switchboard User Accounts Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-useraccounts'
license=('GPL3')
groups=('pantheon')
depends=('accountsservice' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gnome-desktop' 'gtk3' 'libgee' 'libpwquality' 'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'gobject-introspection' 'switchboard' 'vala')
source=("switchboard-plug-user-accounts-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-useraccounts/archive/${pkgver}.tar.gz")
sha256sums=('4787134c1f99b17b8ab1671766e69841b6e704b9898d8e6dc6f54fc8e356b4e8')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard-plug-useraccounts-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
