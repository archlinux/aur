pkgname=rustup-toolchain-install-master-git
pkgver=1.5.0.45.g15a2bb5
pkgrel=1
pkgdesc="Install a rustc master toolchain usable from rustup"
arch=('x86_64' 'i686')
url="https://github.com/kennytm/rustup-toolchain-install-master"
license=('MIT')
depends=('rustup')
makedepends=('cargo')
optdepends=()
provides=('rustup-toolchain-install-master')
conflicts=('rustup-toolchain-install-master')
source=($pkgname::git+https://github.com/kennytm/rustup-toolchain-install-master)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/rustup-toolchain-install-master" "$pkgdir/usr/bin/rustup-toolchain-install-master"
}
