# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.18.0
pkgrel=2
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz"
        "shutdown-prefix-in-reboot-check.patch::https://github.com/davmac314/dinit/commit/213d3fb1bff820f9cbe981193ad06c103d787405.patch")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('ec854903e93416b3f65e72009dcde4965869d8793e2314565484d94ede534e48'
            '9c90921a55b1bbc7a3c3b934ee56bb58940b5c3768635b4684ae1f408b52fb60')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/shutdown-prefix-in-reboot-check.patch"
}

build () {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin SHUTDOWN_PREFIX="dinit-" install
}
