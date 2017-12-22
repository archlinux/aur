# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-datetime-git
pkgver=r238.b5053e8
pkgrel=1
pkgdesc='Date & Time indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('evolution-data-server' 'glib2' 'glibc' 'gtk3' 'libgee' 'libical'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-datetime')
conflicts=('wingpanel-indicator-datetime')
source=('git+https://github.com/elementary/wingpanel-indicator-datetime.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-datetime

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-datetime

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-datetime/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-datetime/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
