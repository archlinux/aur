# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

pkgname=lib32-exiv2
_pkgbase=exiv2
pkgver=0.27.6
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (32-bit)"
arch=('x86_64')
url="https://exiv2.org"
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-expat' 'exiv2')
makedepends=('cmake')
source=("https://github.com/Exiv2/$_pkgbase/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('7d7121770a9394efd31acb74709583e587351fc48c485a2f684cacce4ed19a2d07a6cb1cea986c16bf64851fd53b22a7277c1e1ae1a6cd69a5761afae3c5c731')

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

