# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ortp
pkgver=5.4.50
pkgrel=1
pkgdesc='A Real-time Transport Protocol (RTP) library'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(AGPL-3.0-only)
depends=(bctoolbox)
makedepends=(cmake doxygen)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('172d0f7b3d1c9b124b78bd887bc0db6f6737213689c9d986ae48fec9cf4e092a')

prepare() {
  sed '/WARN_AS_ERROR/d' -i $pkgname-$pkgver/ortp.doxygen.in
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=YES \
    -DENABLE_DOC=NO \
    -DENABLE_UNIT_TESTS=NO \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
