# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=idsk
pkgver=0.20
pkgrel=1
pkgdesc="A tool for managing Amstrad CPC DSK images"
arch=('i686' 'x86_64')
url="https://github.com/cpcsdk/idsk"
license=('MIT')
depends=()
source=("https://github.com/cpcsdk/idsk/archive/refs/tags/v"$pkgver".tar.gz"
"archlinux.patch")
md5sums=('5447c6e4460fe19176709c647961c7d3'
'51d54db326d89919acb7d456969d2499')

build() {
  cd "$srcdir/idsk-"$pkgver
  patch -p1 < ../archlinux.patch
  mkdir -p build
  cd build
  cmake ..
  make || return 1
}

package() {
  cd "$srcdir/idsk-"$pkgver"/build"
  make DESTDIR="$pkgdir" install
}

