# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-smart-video-wallpaper-reborn
pkgname=plasma6-wallpapers-smart-video-wallpaper-reborn-git
pkgver=2.3.2.r1.g3316665
pkgrel=1
pkgdesc="Smart KDE Plasma 6 Wallpaper plugin to play videos on your Desktop/Lock Screen"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace' 'qt6-multimedia' 'qt6-multimedia-backend')
makedepends=('extra-cmake-modules' 'gettext' 'python' 'git')
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
  python ./kpac i18n --no-merge
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
