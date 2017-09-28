# Maintainer: orumin <dev at orum.in>

pkgname=lib32-gd
_basename=gd
pkgver=2.2.5
pkgrel=1
pkgdesc="Library for the dynamic creation of images by programmers (32-bit)"
arch=('x86_64')
url="http://www.libgd.org/"
license=('custom')
depends=('lib32-fontconfig' 'lib32-libxpm' 'lib32-libwebp' 'gd')
optdepends=('perl: bdftogd script')
checkdepends=('ttf-liberation')
source=("https://github.com/libgd/libgd/releases/download/gd-${pkgver}/libgd-${pkgver}.tar.xz")
md5sums=('8d8d6a6189513ecee6e893b1fb109bf8')

prepare() {
  cd libgd-${pkgver}
}

build() {
  cd libgd-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --build=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --disable-rpath
  make
}

check() {
  cd libgd-${pkgver}
  #make check
}

package() {
  cd libgd-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}"/usr/include
}
