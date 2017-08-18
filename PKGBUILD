# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=f1spirit
pkgver=0.rc9.1615
pkgrel=4
pkgdesc="Classic MSX race game remade by Brain Games"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/f1spirit"
depends=('sdl_image' 'sdl_mixer' 'sdl_net' 'glu' 'curl')
source=("http://braingames.jorito.net/f1spirit/f1spirit.src_0.rc9-1615.tgz"
        "f1spirit.patch")
sha256sums=('fc1778dcec68ccd31b9da893abee67e64a7931a34c75a63f8563355b810acbd7'
            'a7b76bd1ed09c6144fc7ab94ba4568fb3a10dbdac5b7e907e1a1c09b7d2b0464')

prepare() {
  cd $pkgname-$pkgver

  # fix compile errors and bin path
  patch -p0 < ../f1spirit.patch

  sed -i "s/-g3 -O3/$CFLAGS/" build/linux/Makefile
  sed -i "/LDFLAGS =/s/$/ $LDFLAGS/" build/linux/Makefile
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir"/usr install
}
