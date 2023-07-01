# Maintainer: Andrew Ryan <dnrops@outlook.com>
#

pkgname=arch-cli-git
_pkgname="arch-cli"
pkgver=1.0.2
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://dnrops.gitee.io"
license=("MIT")
arch=("x86_64")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://gitcode.net/dnrops/aur-cli-git.git")
sha256sums=('SKIP')

build() {
	  cd "$srcdir/$pkgname"
    export CARGO_TARGET_DIR=target
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
}
