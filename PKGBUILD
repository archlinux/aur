# Maintainer: Pig Fang <g-plane@hotmail.com>

_pkgname=yazi
pkgname=yazi-git
pkgver=0.1.2
pkgrel=1
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O."
url="https://github.com/sxyazi/yazi"
arch=("x86_64")
license=("MIT")
depends=(gcc-libs ttf-nerd-fonts-symbols)
optdepends=(
    'jq: for JSON preview'
    'unarchiver: for archive preview'
    'ffmpegthumbnailer: for video thumbnails'
    'fd: for file searching'
    'ripgrep: for file content searching'
    'fzf: for directory jumping'
    'zoxide: for directory jumping')
makedepends=(cargo)
provides=(yazi)
source=("git+https://github.com/sxyazi/$_pkgname.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

