# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=libmp4v2
pkgname=lib32-$_pkgname
pkgver=5.0.1
pkgrel=1
pkgdesc="An API to create and modify mp4 files as defined by ISO-IEC:14496-1:2001 MPEG-4 Systems"
arch=('x86_64')
license=('MPL')
url="https://github.com/TechSmith/mp4v2"
depends=($_pkgname 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://github.com/TechSmith/mp4v2/archive/Release-ThirdParty-MP4v2-$pkgver.tar.gz")
sha512sums=('662b85e2d5cd1c190e7cbc7074914f750939694f8391ebf1402ecb90c533a35acc5bb5a1cfa852fc06e39c0b7e92142d26f8ee94fa2e6df2c0b1ed94fc2c63d7')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  cd mp4v2-Release-ThirdParty-MP4v2-$pkgver

  # https://github.com/TechSmith/mp4v2/issues/48
  CXXFLAGS="$CXXFLAGS -Wno-narrowing" ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd mp4v2-Release-ThirdParty-MP4v2-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

