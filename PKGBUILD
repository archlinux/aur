# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
pkgname="rv8-git"
_pkgname="rv8"
pkgver=8342590
pkgrel=1
pkgdesc="RISC-V simulator for x86-64"
arch=('x86_64')
url="https://rv8.io/"
license=('MIT')
depends=('riscv64-linux-gnu-gcc')
makedepends=('git')
provides=("rv8")
conflicts=("rv8")
source=("rv8::git+https://github.com/rv8-io/rv8.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-parse --short HEAD
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_pkgname"
	export RISCV="/usr"
	make DEST_DIR="/usr" enable_harden=1
}

package() {
	cd "$srcdir/$_pkgname"
	mkdir "$pkgdir/usr/" "$pkgdir/usr/bin/" "$pkgdir/usr/lib/"
	make DEST_DIR="$pkgdir/usr" install
    install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
