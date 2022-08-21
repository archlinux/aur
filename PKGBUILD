# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>

pkgname=inlyne
pkgver=0.1.7
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma openssl)
makedepends=(cargo libxcb libxkbcommon)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('97a9ebe3d0bb5212715e28eadc00b21645c9812c8a958ea3fe434b005f69f605ddd340c858a7050916b4b5d6f94ef743b4ddab5a9bfcf7e0ed84cbd8f9aaa9da')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
