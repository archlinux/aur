# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ortp
pkgver=5.3.5
pkgrel=1
pkgdesc='A Real-time Transport Protocol (RTP) library'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL3)
depends=(bctoolbox)
makedepends=(cmake doxygen)
source=(https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('65459d91c40aedb99c80ee86b12ea29f1a275e0d6fe2acaf40b7ce542074f2c9')

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
