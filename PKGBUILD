# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>
pkgname=libtsm
pkgver=4.0.2
pkgrel=1
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/kmscon/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'libxkbcommon')
options=(!libtool)
source=("https://github.com/Aetf/libtsm/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ce51be564872d3e6a35fadab1f74b8804f72d8a92c0f378ca384155134d154e5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
