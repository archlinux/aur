# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.3.0
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma openssl)
makedepends=(cargo libxcb libxkbcommon)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('61e2bf7704445f06d4fcf3fde2df381257f02573c058091cec46b60447176e254e7a528079333854435296d1ab1cc48690d003328642e404fc170d9d55370a2f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTONIG_SYSTEM_LIBONIG=yes cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTONIG_SYSTEM_LIBONIG=yes cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
