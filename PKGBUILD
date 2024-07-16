# Maintainer: Šimon Hacaj <hacajsimon@gmail.com>
pkgname="sail-img"
pkgver=0.9.5
pkgrel=2
pkgdesc="The missing small and fast image decoding library for humans (not for machines)"
arch=(x86_64)
url="https://github.com/HappySeaFox/sail"
license=('MIT')
depends=(
  'jasper' 'libwebp' 'giflib' 'libjpeg-turbo' 'libavif'
  'libjxl' 'libpng' 'libtiff' 'gcc-libs' 'glibc'
)
makedepends=('git' 'cmake')
provides=("libsail" "libsail-common" "libsail-c++" "libsail-manip")
source=(
  ${pkgname}-${pkgver}.tar.gz::https://github.com/HappySeaFox/sail/archive/refs/tags/v${pkgver}.tar.gz
)
sha256sums=('28c601c0399be1940710afc150b5836f8b3f5f6a35b98d7ac1467e62bc568e20')

prepare() {
  cd "${srcdir}/sail-${pkgver}"
  mkdir ./build -p
}

build() {
	cd "${srcdir}/sail-${pkgver}/build"
  cmake -DSAIL_BUILD_APPS=OFF -DSAIL_BUILD_EXAMPLES=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/sail-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

  install -D -m644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
