# Maintainer: Drommer <drommer@github.com>

_pkgname=breath
pkgname=breath-classic-theme-git
pkgver=r185.617c21d0
pkgrel=1
pkgdesc="Classic Breath Plasma Look & Feel package by Manjaro Team (ex-Breath2)"
provides=('breath-classic-icon-theme' 'breath-classic-wallpaper' 'plasma5-themes-breath-classic')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/$_pkgname"
license=('LGPL')
depends=('breeze' 'plasma-framework' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git' 'plasma-framework')
optdepends=('breath-gtk-theme: Breath widget style for GTK applications')
source=("git+$url.git#branch=classic")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_ICON_THEMES=ON \
    -DBUILD_PLASMA_THEMES=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
