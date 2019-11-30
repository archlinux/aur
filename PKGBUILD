pkgname=pix-image-viewer-git
pkgver=0.2.6.108.g54e4f24
pkgrel=1
pkgdesc="Desktop image viewer. View thousands of images in a zoomable, pannable grid."
arch=('x86_64' 'i686')
url="https://github.com/google/pix-image-viewer"
license=('Apache-2.0')
depends=()
makedepends=('cargo' 'git')
optdepends=()
provides=('pix-image-viewer')
conflicts=('pix-image-viewer')
source=($pkgname::git+https://github.com/google/pix-image-viewer)
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
	install -D -m755 "$srcdir/$pkgname/target/release/pix" "$pkgdir/usr/bin/pix-image-viewer"
}
