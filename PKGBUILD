# Maintainer: Danny Grove <aur@dannygrove.com>
name=swhid-rs
pkgname=$name-git
pkgver=c8a9c24
pkgrel=1
pkgdesc="Reference implementation of the Software Hash Identifier (SWHID) standard - ISO 18670 "
url="https://github.com/swhid/$name"
license=("MIT")
arch=("any")
conflicts=("$name" "swhid")
makedepends=("cargo" "libssh2")
source=("git+$url")
sha256sums=('SKIP')

build() {
  export LIBSSH2_SYS_USE_PKG_CONFIG=0
  cd "$srcdir/$name"
	cargo fetch
	cargo build --frozen --release --features git,serde --bin swhid
}

package() {
  cd "$srcdir/$name"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$name/"
	install -Dm755 target/release/swhid -t "$pkgdir/usr/bin/"
}
