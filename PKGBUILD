# Maintainer: DrunkLeen <snape@drunkleen.com>

_pkgauthor=drunkleen
_pkgname=leenfetch

pkgname=${_pkgname}
pkgver=1.4.0
pkgrel=1
pkgdesc="modern, minimal, and the fastest neofetch like system information tool with remote fetch ability, written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libx11' 'libxrandr' 'glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d40ff703a83a20d8568a6a91c17331703315d1242f2ade93dbe9b54c6092076')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/leenfetch" "$pkgdir/usr/bin/leenfetch"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "leenfetch.1" "$pkgdir/usr/share/man/man1/leenfetch.1"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
