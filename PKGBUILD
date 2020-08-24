# Maintainer: Antoine Viallon <antoine@lesviallon.fr>
# Contributor: Zan <zan@cock.li>

pkgname=qt-avif-image-plugin-libavif-git
_basename=${pkgname%-git}
_pkgname=qt-avif-image-plugin
pkgver=r68.6920fe4
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write AVIF images.'
arch=(x86_64)
url='https://github.com/novomesk/qt-avif-image-plugin'
license=('BSD')
depends=(qt5-base libavif-git)
makedepends=(git extra-cmake-modules)
source=("git+https://github.com/novomesk/qt-avif-image-plugin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$_pkgname"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
