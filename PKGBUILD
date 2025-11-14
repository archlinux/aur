# Maintainer: Mobin Aydinfar <mobin@mobintestserver.ir>
pkgname=dinit
pkgver=0.20.0
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.xz::https://github.com/davmac314/dinit/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
arch=(x86_64 arm aarch64)
license=(Apache)
optdepends=('libcap: linux capabilities(7) settings support')
makedepends=('linux-headers')
sha256sums=('f8e3f92629d9aeb7d09e1859dd1cfc2754c11873e16b407a41025f6e81e9e33c')

build() {
  cd "$pkgname-$pkgver"
  ./configure --bindir="/usr/bin" --sbindir="/usr/bin" --shutdown-prefix="dinit-"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
  make check-igr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
