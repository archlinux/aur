# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

pkgname=lib32-exiv2
_pkgbase=exiv2
pkgver=0.27.3
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (32-bit)"
arch=('x86_64')
url="https://exiv2.org"
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-expat' 'exiv2')
makedepends=('cmake')
source=("https://exiv2.org/builds/$_pkgbase-$pkgver-Source.tar.gz")
sha256sums=('a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778')

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

  cd "$_pkgbase-$pkgver-Source"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DEXIV2_ENABLE_VIDEO=ON \
    -DEXIV2_BUILD_SAMPLES=OFF \
    -DEXIV2_ENABLE_NLS=ON
  make
}

package() {
  cd "$_pkgbase-$pkgver-Source"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{bin,include,share}
}

