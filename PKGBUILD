# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-smart-video-wallpaper-reborn
pkgname=plasma6-wallpapers-smart-video-wallpaper-reborn-git
pkgver=2.9.0.r24.g1fd9153
pkgrel=1
pkgdesc="Smart KDE Plasma 6 Wallpaper plugin to play videos on your Desktop/Lock Screen"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL-3.0-only')
depends=('plasma-workspace' 'qt6-multimedia' 'qt6-multimedia-backend')
makedepends=('cmake' 'extra-cmake-modules' 'gettext' 'git')
source=("$_gitname"::"git+${url}")
sha256sums=('SKIP')
provides=('plasma6-wallpapers-smart-video-wallpaper-reborn')
conflicts=('plasma6-wallpapers-smart-video-wallpaper-reborn')


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
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
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
