# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=auth
pkgname="$_pkgname-tui"
pkgver=0.2.2
pkgrel=1
pkgdesc='Authenticator TUI. Generate totps on the fly.'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('744ad4e6b042277703bff9df2143cd296eafebe20a158c2c5f593a097fe5dd0a')
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
