# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.15.1
pkgrel=9
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz"
        "custom-shutdown-prefix.patch::https://github.com/davmac314/dinit/commit/7788798e14890a98c1e554e1a455e705dc1308fb.patch")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('b6cc489079a6600ae5f89cbc52b6046bd522e8e91da60c6a3006c4224cba83b4'
            'ed9ac7b9d9082f311829e2b44c9aaeff2aed344c51b1c8f17c2b6a7ce005F4cc')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/custom-shutdown-prefix.patch"
}

build () {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin SHUTDOWN_PREFIX="dinit-" install
}
