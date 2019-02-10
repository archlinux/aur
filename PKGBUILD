# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.3
pkgrel=2
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/v${pkgver}.tar.gz"
        0001-Fix-getenv-returning-NULL.patch)
sha512sums=('dcb6d7c4d02e55d5c3e4e542c8fc99e6b6476f7f96711024f4a61103b2e5aa61c83994cb45b7510727e3e2f3201efb738929f495a0939874fcd09818513c6f1e'
            '4f9c4d7f7a255ba35adc362ff278b0b55bea7fc92ccc6ad8f0c725b78b72aacc2239e22ce8e58b07ddb7101e2016cb2791bdc77169b1d3a72fded908b84d5f3e')

prepare() {
  cd libTAS-$pkgver

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "libTAS-$pkgver"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
