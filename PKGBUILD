pkgname=bootimage-git
_pkgname=bootimage
pkgdesc="Tool to create a bootable OS image from a kernel binary."
pkgrel=1
pkgver=0.3.0.66
arch=('i686' 'x86_64')
conflicts=("bootimage")
provides=("bootimage")
url="https://github.com/rust-osdev/bootimage"
license=('NULL')
depends=('cargo-xbuild')
makedepends=('rust' 'cargo')
optdepends=()
source=("$_pkgname::git+https://github.com/rust-osdev/bootimage")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/bootimage" "$pkgdir/usr/bin/bootimage"
}
