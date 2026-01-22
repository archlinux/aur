# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=flamethrower
pkgver=0.12.0
pkgrel=1
pkgdesc='DNS performance and functional testing utility'
arch=(i686 x86_64 aarch64)
url='https://github.com/DNS-OARC/flamethrower'
license=(Apache-2.0)
depends=(ldns libuv gnutls libnghttp2)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DNS-OARC/flamethrower/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f7d792b4464ddc55ab7c3acfe250bc56751923790301798c3b3ce9516dd342d')

build() {
  arch-meson "$srcdir/$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 man/flame.1 \
    "$pkgdir/usr/share/man/man1/flame.1"
}
