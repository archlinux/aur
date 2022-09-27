# Maintainer: grimi
pkgname=uade-git
pkgver=r1464.6338df4
pkgrel=1
pkgdesc="uade plays 200+ Amiga computer music formats"
arch=("x86_64")
url="https://gitlab.com/uade-music-player/uade"
license=("GPL")
depends=("libao" "bencodetools" "libzakalwe")
makedepends=("pkgconf" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/uade-music-player/uade.git")
md5sums=('SKIP')


pkgver() {
   cd ${pkgname%-git}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr --without-write-audio
  make
}

package() {
  cd ${pkgname%-git}
  make install DESTDIR="$pkgdir"
}

