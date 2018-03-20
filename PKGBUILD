# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kholidays-git
pkgver=latest
pkgrel=2
pkgdesc="KDE library for regional holiday information"
arch=("any")
url="https://projects.kde.org/projects/kde/pim/${gitname%-git}"
license=("LGPL")
depends=("kdelibs4support")
makedepends=("extra-cmake-modules-git" "git" "python")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git://anongit.kde.org/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/${pkgname%-git}/build"
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
}
