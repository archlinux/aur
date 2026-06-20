# Maintainer: Gui Rossibrum <guirossibrum@proton.me>
# Contributor: Gui Rossibrum <guirossibrum@proton.me>

pkgname=guicrypt-tui
pkgver=1.1.0
pkgrel=1
pkgdesc="TUI manager for gocryptfs encrypted vaults"
arch=('x86_64')
url="https://github.com/guirossibrum/guicrypt-tui"
license=('MIT')
depends=('gocryptfs' 'libsecret')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build -j"$(nproc)"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
