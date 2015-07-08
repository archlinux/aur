# Maintainer: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>

pkgname=x264-git
_gitname="x264"
pkgver=0.r2377.1ca7bb9
pkgrel=2
pkgdesc="H.264 video encoder and library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm')
url="http://www.videolan.org/developers/x264.html"
conflicts=('x264' 'libx264')
provides=('x264' 'libx264')
source=('git://git.videolan.org/x264.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname

  ./configure --enable-shared
  make
}

package() {
  cd $_gitname

  make DESTDIR="$pkgdir" \
    bindir=/usr/bin \
    libdir=/usr/lib \
    includedir=/usr/include \
    install
}
