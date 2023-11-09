# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

pkgname=lib32-exiv2
_pkgbase=exiv2
pkgver=0.28.1
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (32-bit)"
arch=('x86_64')
url="https://exiv2.org"
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-expat' 'exiv2'
         'lib32-libinih')
makedepends=('cmake')
source=("https://github.com/Exiv2/$_pkgbase/archive/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('7b872a3c0cbe343014b1ca4618cecaf6ee8d78dec7ef83accfce95cb8eadc6b52116977a41e1f1be5c6149a47bdd9457fadc08d73708aa2a6ab69795fd3de23b')
b2sums=('a26f8e54cf6284c56ff429c13d5a8985dc6181a36b4c13ea6f2e59bc00016a2a8d915ddbc0cedb441b8283e30f18312a500900ffd89ca984006ac84807a03852')

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

  cd "$_pkgbase-$pkgver"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DEXIV2_ENABLE_VIDEO=ON \
    -DEXIV2_BUILD_SAMPLES=OFF \
    -DEXIV2_ENABLE_NLS=ON
  make
}

package() {
  cd "$_pkgbase-$pkgver"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{bin,include,share}
}

