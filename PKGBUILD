# Maintainter: Talebian <nicco199os@gmail.com>
pkgname=bottles-git
pkgver=2.0
pkgrel=1
pkgdesc="Easily manage wineprefix using environments"
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=('python' 'dconf' 'hicolor-icon-theme')
makedepends=('meson' 'ninja')
source=("git://github.com/bottlesdevs/Bottles")
sha256sums=('SKIP')

_repo="Bottles"

build () {
  cd "$srcdir/$_repo"
  rm -rf build
  mkdir build
  meson build
  cd build
  ninja -j$(nproc)
}

package () {
  cd "$srcdir/$_repo/build"
  DESTDIR="$pkgdir/" ninja install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_repo/LICENSE"
}

