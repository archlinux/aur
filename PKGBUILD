# Maintainer: steamport <steamport@tutanota.com>
pkgname=kristforge-git
pkgver=r52.41c96dd
pkgrel=1
pkgdesc="Kristforge is a cross-platform hardware accelerated GPU and CPU krist miner. Kristforge uses OpenCL and accelerated CPU instruction sets to maximize performance, making it the fastest krist miner in existence."
arch=('x86_64')
url="https://github.com/tmpim/kristforge"
license=('Apache-2.0')
groups=()
depends=('glibc' 'gcc-libs' 'openssl' 'zlib')
makedepends=('git' 'cargo')
optdepends=('opencl-driver: GPU support')
provides=('kristforge')
conflicts=('kristforge')
replaces=()
backup=()
options=()
install=
source=('kristforge::git+https://github.com/tmpim/kristforge.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/kristforge"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/kristforge"
	cargo build --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/kristforge/target/release/kristforge" "$pkgdir/usr/bin/kristforge"
}
