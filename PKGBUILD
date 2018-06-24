# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-privacy-git
pkgver=r68.4a3abae
pkgrel=1
pkgdesc='Privacy indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-privacy'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop' 'lsof'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-privacy')
conflicts=('wingpanel-indicator-privacy')
source=('git+https://github.com/elementary/wingpanel-indicator-privacy.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-privacy

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel-indicator-privacy \
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
