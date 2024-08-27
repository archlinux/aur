
# Maintainer: James Williams <jowilliams12000 at gmail dot com>
pkgname=wallust-git
_pkgname=wallust
pkgver=3.0.0.r0.g2fe6f57
pkgrel=1
pkgdesc="generate colors from an image"
arch=('any')
url="https://codeberg.org/explosion-mental/wallust"
license=('custom:MIT')
makedepends=('cargo' 'git' 'make')
optdepends=('imagemagick')
provides=('wallust=$pkgver')
conflicts=('wallust')
source=("$_pkgname::git+$url#branch=master")
options=('!lto')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_BUILD_DIR=target
	cargo build --release
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wallust/LICENSE"
}
