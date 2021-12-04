# Maintainer: novenary <streetwalkermc@gmail.com>
# Contributor: Alex Zaslavsky <alex@wall-dev.org>

pkgname=gebaar-libinput-fork
pkgver=0.1.5
pkgrel=1
pkgdesc='A Super Simple WM Independent Touchpad Gesture Daemon for libinput. Forked version with new features'
arch=('x86_64')
url="https://github.com/9ary/gebaar-libinput-fork"
license=('GPL3')
depends=('libinput')
makedepends=('cmake' 'ninja')
conflicts=('gebaar')
provides=('gebaar')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b7af34d8ffb7a24e234adef5b8aa6faf')

build() {
  cd $pkgname-$pkgver

  cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX="/usr"
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
