# Maintainer: Andrew dnrops@outlook.com
pkgname='biying_search_file'
_pkgname='biying_search_file'
pkgver=1.0.1
pkgrel=1
pkgdesc="This is a CLI for search file in biying"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://gitcode.net/dnrops/biying_search_file.git"
license=('GPL3')
depends=('base' 'glib2' 'pciutils')
conflicts=("$_pkgname")
makedepends=('git' 'cargo')
source=("$pkgname::git+https://gitcode.net/dnrops/biying_search_file.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	  cd "$srcdir/$pkgname"
	# export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 "target/release/biying_search_file" -t "$pkgdir/usr/bin/"
}

