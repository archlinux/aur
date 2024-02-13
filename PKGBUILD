# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: James Williams <jowilliams12000 at gmail dot com>
pkgname=wallust-git
pkgver=2.10.0.r47.g6b92027
pkgrel=1
pkgdesc="generate colors from an image"
arch=('any')
url="https://codeberg.org/explosion-mental/wallust"
license=('custom:MIT')
makedepends=('cargo' 'git')
optdepends=('imagemagick')
provides=('wallust=$pkgver')
conflicts=('wallust')
source=("$pkgname::git+$url#branch=dev")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_BUILD_DIR=target
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/wallust -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wallust/LICENSE"
}
