# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ortp
pkgver=5.2.32
pkgrel=1
pkgdesc='A Real-time Transport Protocol (RTP) library'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL3)
depends=(bctoolbox)
makedepends=(cmake doxygen)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('68f9fa234b56e457fa3ae7f64ff35ce614699674cf2de764a3407436d4efa33c')

prepare() {
  sed '/WARN_AS_ERROR/d' -i $pkgname-$pkgver/ortp.doxygen.in
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF \
    -DENABLE_DOC=NO \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
