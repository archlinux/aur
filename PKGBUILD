# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>
pkgname=libtsm
pkgver=4.1.0
pkgrel=1
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/kmscon/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'libxkbcommon')
options=(!libtool)
source=("https://github.com/Aetf/libtsm/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('879a166a07aed63146ffe3e2afe803c0c3e22f264db0f1fa6fdb44687adeeef8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
