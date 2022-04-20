# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=multiblend
pkgver=2.0rc5
pkgrel=1
pkgdesc="Image blender for the seamless blending of panoramic images similar to enblend"
arch=('x86_64')
url="http://horman.net/multiblend/"
license=('GPL3')
depends=('libjpeg-turbo' 'libpng' 'libtiff')
source=("http://horman.net/multiblend/multiblend${pkgver}.tar.gz")
md5sums=('5dda37b108fd2cf33f0e10dd0fc4f31d')

build() {
  cd "$srcdir/$pkgname/src"

  # note: SSE2 must be enabled in order to compile (needed especially on i686)
  g++ $CXXFLAGS -msse4.1 -pthread -ffast-math -Ofast -o multiblend multiblend.cpp -lm -lpng -ltiff -ljpeg $LDFLAGS

}

package() {
  cd "$srcdir/$pkgname/src"

  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
