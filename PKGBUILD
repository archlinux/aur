# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-ayatana-git
pkgver=r36.8533b03
pkgrel=2
pkgdesc='Wingpanel Ayatana-Compatibility Indicator (community fork)'
arch=('i686' 'x86_64')
url='https://github.com/Lafydev/wingpanel-indicator-ayatana'
license=('GPL3')
depends=('glib2' 'glibc' 'gtk3-ubuntu' 'indicator-application' lib{indicator-gtk3-ubuntu,{granite,wingpanel}.so})
makedepends=('git' 'meson' 'vala' 'wingpanel')
provides=('wingpanel-indicator-ayatana')
conflicts=('wingpanel-indicator-ayatana')
source=('git+https://github.com/Lafydev/wingpanel-indicator-ayatana.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-ayatana

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-ayatana

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-ayatana/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-ayatana/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
