# Maintainer: bigsmoke <and_a_large_soda et proton DOT me>
pkgname=circom-git
pkgver=v2.1.2.r0.g2fbf965
pkgrel=1
# epoch=
pkgdesc="A compiler for cryptographic circuits used for zkSNARK and PLONK proofs"
arch=('any')
url="https://docs.circom.io"
license=('GPL')
#groups=()
depends=()
makedepends=(git cargo)
#checkdepends=()
#optdepends=()
provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=($pkgname::git+https://github.com/iden3/circom.git)
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {}

build() {
	cd "$pkgname"
	cargo build -j$(nproc) --release
}

package() {
	cd $srcdir/$pkgname
	# installs to target/release
	cargo install -j$(nproc) --path circom
	# just move bin
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
