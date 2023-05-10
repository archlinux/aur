# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.3.1
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma openssl)
makedepends=(cargo libxcb libxkbcommon)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('146111a5f2b128e0a656122885a97ccef223dbfcaa8a794f7d1a3ab14adb1fb62c80630783406db67810225b17b566efff0eaeee875770afad9fb61467c5375a')

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
