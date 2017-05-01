# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-a11y-git
pkgver=r6.50f0e85
pkgrel=1
pkgdesc='Universal Access indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-a11y')
conflicts=('wingpanel-indicator-a11y')
replaces=('wingpanel-indicator-a11y-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-a11y.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-a11y

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-a11y

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-a11y/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-a11y/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
