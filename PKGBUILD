# Maintainer: Anthony Vital <anthony.vital@gmail.com>
# Contributor: Erica Clawson <blargle.ragequit@gmail.com>
# Contributor: Andrew Chen <andrew.chuanye.chen@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=plasma6-applets-gmailfeed
_pkgname=gmailfeed
pkgver=2.0
pkgrel=1
pkgdesc="A Plasma 6 plasmoid showing your Gmail feed."
arch=('i686' 'x86_64')
url="https://github.com/anthon38/gmailfeed"
license=('GPL-3.0-or-later')
replaces=('plasma5-applets-gmailfeed')
depends=('plasma-workspace' 'hicolor-icon-theme' 'knotifications' 'kaccounts-integration')
makedepends=('extra-cmake-modules' 'intltool')
install=${pkgname}.install
source=("https://github.com/anthon38/gmailfeed/archive/v$pkgver.tar.gz")
sha256sums=('5589f4e54208bcdb79569ebabeaf10e66361b9b3cc05853ec3e1826db297c766')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${_pkgname}-${pkgver}"/build

  make DESTDIR="${pkgdir}" install
}
