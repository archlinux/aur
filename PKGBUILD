# Maintainer: Mobin Aydinfar <mobin@mobintestserver.ir>
pkgname=dinit
pkgver=0.23.0
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.xz::https://github.com/davmac314/dinit/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
arch=(x86_64 arm aarch64)
license=(Apache)
depends=('libcap')
makedepends=('linux-headers')
sha256sums=('b99067eb85f6e69c7e1411b6e0956ea1ae0831598bae5a4361ebef87317c326e')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    CXXFLAGS="-std=c++11 $CXXFLAGS" \
    --disable-strip \
    --platform=Linux \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin/" \
    --shutdown-prefix="dinit-"
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
