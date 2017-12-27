# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-git
pkgver=r325.99d68c1
pkgrel=1
pkgdesc='Stylish top panel that holds indicators and spawns an application launcher'
arch=('x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
makedepends=('cmake' 'gala-git' 'git' 'granite-git' 'vala')
provides=('wingpanel' 'libwingpanel-2.0.so')
conflicts=('wingpanel')
replaces=('wingpanel-bzr')
source=('git+https://github.com/elementary/wingpanel.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
