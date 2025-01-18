# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=auth
pkgname="$_pkgname-tui"
pkgver=0.1.8
pkgrel=1
pkgdesc='Authenticator TUI. Generate totps on the fly.'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c8173710de68102286104add55939a75e222171a2ad405db5124ef4bc1379dd8')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target
  cd "$_pkgname-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
