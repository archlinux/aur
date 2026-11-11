# Maintainer: RiverOnVenus <aur@zhui.dev>
# Contributor: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-smart-video-wallpaper-reborn
pkgname=plasma6-wallpapers-smart-video-wallpaper-reborn-git
pkgver=2.16.0.r5.gab3b90b
pkgrel=1
pkgdesc="Smart KDE Plasma 6 Wallpaper plugin to play videos on your Desktop/Lock Screen"
arch=('x86_64')
options=('!debug')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL-2.0-or-later')
depends=('plasma-workspace' 'plasma5support' 'qt6-multimedia' 'qt6-multimedia-backend')
makedepends=('cmake' 'extra-cmake-modules' 'gettext' 'git')
source=("$_gitname"::"git+${url}")
sha256sums=('SKIP')
provides=('plasma6-wallpapers-smart-video-wallpaper-reborn')
conflicts=('plasma6-wallpapers-smart-video-wallpaper-reborn')


pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./' \
      || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake -B build -S . \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}"
  DESTDIR="$pkgdir" cmake --install build
}
