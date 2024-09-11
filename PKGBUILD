# Maintainer: Drommer <drommer@github.com>

_pkgname=breath
pkgname=breath-theme-git
pkgver=r270.1b708941
pkgrel=1
pkgdesc="Breath Plasma Look & Feel packages by Manjaro Team"
provides=('breath-wallpaper' 'plasma-themes-breath' 'sddm-breath-theme' 'yakuake-skin-breath')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/breath"
license=('LGPL-2.0-or-later' 'CC-BY-SA-4.0' 'GPL-3.0-only' 'GPL-2.0-or-later')
depends=('breeze' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git' 'libplasma')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  mkdir -p build
  cd build
  cmake ../$_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_PLASMA_THEMES=ON \
    -DBUILD_SDDM_THEME=ON \
    -DBUILD_EXTRA_COLORS=ON \
    -DBUILD_MIGRATION=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
