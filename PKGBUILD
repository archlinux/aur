# Maintainer: Zan <zan@cock.li>

pkgname=qt-avif-image-plugin-git
_basename=${pkgname%-git}
pkgver=r39.c518247
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write AVIF images.'
arch=(x86_64)
url='https://github.com/novomesk/qt-avif-image-plugin'
license=('BSD')
depends=(qt5-base avif-git)
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
