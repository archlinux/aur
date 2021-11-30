# Maintainer: Drommer <drommer@github.com>

_pkgname=breath
pkgname=breath-theme-git
pkgver=r203.58f18ef0
pkgrel=1
pkgdesc="Breath Plasma Look & Feel packages by Manjaro Team"
provides=('breath-wallpaper' 'plasma5-themes-breath' 'sddm-breath-theme')
conficts=('breath-legacy-wallpaper' 'plasma5-themes-breath-legacy' 'sddm-breath-legacy-theme' 'breath2-icon-theme' 'breath2-wallpaper' 'plasma5-themes-breath2' 'sddm-breath2-theme')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/$_pkgname"
license=('LGPL')
depends=('breeze' 'plasma-framework' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git' 'plasma-framework')
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
    -DBUILD_SDDM_THEME=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
