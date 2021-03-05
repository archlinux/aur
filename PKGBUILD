# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=libwebm
pkgver=1.0.0.27
pkgrel=1
pkgdesc="WebM video file parser"
url="https://www.webmproject.org/"
arch=('x86_64')
license=('BSD')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("https://github.com/webmproject/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        missing_includes.patch
        cmake_install.patch)
sha256sums=('1332f43742aeae215fd8df1be6e363e753b17abb37447190e789299fe3edec77'
            '05a78fbba1d55d7d6cd10961841dd130111d8efb380bb30ed33f78335a0d4193'
            '6870b711d6dc389959429240901cdaf32005d22c8a056d202059fecef6ea727c')

prepare() {
  mkdir -p build
  cd $pkgname-$pkgname-$pkgver
  patch -p1 -i ../missing_includes.patch
  patch -p1 -i ../cmake_install.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    ../$pkgname-$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$pkgname-$pkgname-$pkgver
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
