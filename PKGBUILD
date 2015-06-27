# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=multiblend
pkgver=0.6.2
pkgrel=1
pkgdesc="Image blender for the seamless blending of panoramic images similar to enblend"
arch=('i686' 'x86_64')
url="http://horman.net/multiblend/"
license=('GPL')
depends=('libjpeg-turbo' 'libpng' 'libtiff')
source=("http://horman.net/multiblend/multiblend${pkgver}.tar.gz")
md5sums=('3a2afe6aa55d6ee155029605dbc41751')

build() {
  cd "$srcdir/$pkgname"

  # note: SSE2 must be enabled in order to compile (needed especially on i686)
  gcc $CXXFLAGS -msse2 -ltiff -ltiffxx -ljpeg -lpng $LDFLAGS multiblend.cpp -o $pkgname
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
