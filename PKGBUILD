# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=auth
pkgname="$_pkgname-tui"
pkgver=0.2.1
pkgrel=1
pkgdesc='Authenticator TUI. Generate totps on the fly.'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('81967a5afa135945f32ef4a7381e1e91848d00c0d625e8f2be86d59938edb287')
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
  install -Dm644 "man/$_pkgname.1" -t "$pkgdir/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
