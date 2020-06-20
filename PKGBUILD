# Maintainer: Drommer <drommer@archlinux.org>

pkgname=breath2-git
pkgver=r90.bcca0ed
pkgrel=1
pkgdesc='Breath 2 Look & Feel package (color schemes, icons, Konsole theme, Plasma5 theme, SDDM theme, wallpapers, Yakuake theme)'
arch=(x86_64)
url=https://gitlab.manjaro.org/artwork/themes/breath2
license=('LGPL')
depends=(hicolor-icon-theme)
makedepends=(extra-cmake-modules plasma-framework)
optdepends=('breath-gtk-git: Breath widget style for GTK applications')
source=('git+https://gitlab.manjaro.org/artwork/themes/breath2')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/breath2"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../breath2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_PLASMA_THEMES=ON \
    -DBUILD_ICON_THEMES=ON \
    -DBUILD_SDDM_THEME=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
