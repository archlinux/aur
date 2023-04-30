# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.2.1
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma openssl)
makedepends=(cargo libxcb libxkbcommon)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cf248907ddd9eac380d67eae0033548d57e2a4f59657198fd16c8c1b310210e02c0d881549105925366eae2a599b5552383f07ebe6e6e0384d9497459f8b2b80')

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
