# Maintainer: Ilari Mäkimattila <ilari.makimattila@gmail.com>
_ghname=triplane
pkgname=$_ghname-classic
pkgver=1.0.8
pkgrel=1
pkgdesc="Triplane Classic is a port of Triplane Turmoil side-scrolling
dogfighting game featuring solo missions and multiplayer mode with up to four
players."
arch=("x86_64")
url=https://github.com/vranki/triplane
license=("GPL")
depends=("sdl" "sdl_mixer")
makedepends=("gcc" "make")
source=(
  "https://github.com/vranki/$_ghname/archive/v$pkgver.tar.gz"
  "install-location.patch"
)
sha1sums=(
  "b37dbb6dcfab500c16f265da2f1bf10254828755"
  "1718f611d74870e8a692a3943f756af50393783c"
)

build() {
  cd "$_ghname-$pkgver"
  patch -p1 < ../install-location.patch
  make PREFIX=/usr depend
  make PREFIX=/usr 
}

package() {
  cd "$_ghname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

