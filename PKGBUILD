# Maintainer: Mobin Aydinfar <mobin@mobintestserver.ir>
pkgname=dinit
pkgver=0.22.1
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.xz::https://github.com/davmac314/dinit/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
arch=(x86_64 arm aarch64)
license=(Apache)
depends=('libcap')
makedepends=('linux-headers')
sha256sums=('959b35c171452ecfbc09379b516517dadd675350eebc57ca54aebedda05d9adf')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    CXXFLAGS="-std=c++11 $CXXFLAGS" \
    --platform=Linux \
    --bindir="/usr/bin" \
    --sbindir="/usr/sbin/" \
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
