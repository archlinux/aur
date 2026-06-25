# Maintainer: DrunkLeen <snape@drunkleen.com>

_pkgauthor=drunkleen
_pkgname=leenfetch

pkgname=${_pkgname}
pkgver=1.3.0
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
sha256sums=('91e98f593d15454365783de94c1c7a84a6b2a0a55bb19a6b910debca15a28687')

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
