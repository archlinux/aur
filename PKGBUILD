# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libimagequant-git
pkgver=2.15.1.r11.gb075eb0
pkgrel=1
pkgdesc="Palette quantization library"
arch=('i686' 'x86_64')
url="https://pngquant.org/lib/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('libimagequant')
conflicts=('libimagequant')
options=('staticlibs')
source=("git+https://github.com/ImageOptim/libimagequant.git")
sha256sums=('SKIP')


pkgver() {
  cd "libimagequant"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libimagequant"

  ./configure \
    --prefix="/usr" \
    --with-openmp
  make libimagequant.so static
}

package() {
  cd "libimagequant"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/libimagequant"
}
