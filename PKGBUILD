# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=echaskify
pkgver="0.1.1"
pkgrel=1
epoch=
pkgdesc=""
arch=("any")
url="https://github.com/fraco-oxza/echaskify"
license=('Apache')
groups=()
depends=()
makedepends=("rustup")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=("675b9fa3305a176163f088423cb1e6f4")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm 775 target/release/${pkgname} -t "${pkgdir}/usr/bin" 
}
