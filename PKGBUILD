# Maintainer: Sergey Starovoytov <sergey.starovoytov.94@gmail.com>

pkgname=breath2-kde-theme-git
_pkgname=breath2
pkgver=r110.ed26e232
pkgrel=1
pkgdesc="Breath 2 Look & Feel package (color schemes, icons, Konsole theme, Plasma5 theme, SDDM theme, wallpapers, Yakuake theme)"
provides=('breath2-kde-theme')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/$_pkgname"
license=('LGPL')
depends=('hicolor-icon-theme' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'plasma-framework')
optdepends=('breath-gtk-theme: Breath widget style for GTK applications')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
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
    -DBUILD_PLASMA_THEMES=ON \
    -DBUILD_ICON_THEMES=ON \
    -DBUILD_SDDM_THEME=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
