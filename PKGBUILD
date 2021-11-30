# Maintainer: Drommer <drommer@github.com>

_pkgname=breath
_commit=85732de201180acc9aa396ebf7d85a819fe72c34
pkgname=breath2-git
pkgver=r170.85732de2
pkgrel=1
pkgdesc="Breath 2 Look & Feel package (color schemes, icons, Konsole theme, Plasma5 theme, SDDM theme, wallpapers, Yakuake theme)"
provides=('breath2-icon-theme' 'breath2-wallpaper' 'plasma5-themes-breath2' 'sddm-breath2-theme')
conflicts=('breath-wallpaper' 'plasma5-themes-breath' 'sddm-breath-theme' 'breath-legacy-icon-theme' 'breath-legacy-wallpaper' 'plasma5-themes-breath-legacy' 'sddm-breath-legacy-theme')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/$_pkgname"
license=('LGPL')
depends=('breeze' 'plasma-framework' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git' 'plasma-framework')
optdepends=('breath-gtk-theme: Breath widget style for GTK applications')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count $_commit).$(git rev-parse --short $_commit)
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
