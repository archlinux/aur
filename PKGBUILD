# Maintainer: zan <zan@420blaze.it>

pkgname=qt-avif-image-plugin-git
_basename=${pkgname%-git}
pkgver=r68.6920fe4
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write AVIF images.'
arch=(x86_64)
url='https://github.com/novomesk/qt-avif-image-plugin'
license=(BSD)
depends=(qt5-base libavif)
makedepends=(git extra-cmake-modules)
source=("git+https://github.com/novomesk/qt-avif-image-plugin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$_basename"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_basename/LICENSE" "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
