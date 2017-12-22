# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-privacy-git
pkgver=r19.9492ca4
pkgrel=1
pkgdesc='Privacy indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-privacy'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop'
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
  cd wingpanel-indicator-privacy

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-privacy/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-privacy/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
