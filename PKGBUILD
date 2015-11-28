# Maintainer: Marcel Müller <neikos at neikos dot email>
pkgname=rust-gallery
pkgver=r5.aea1f4b
pkgrel=1
pkgdesc="A simple and fast web gallery, meant for the command line."
url="https://github.com/TheNeikos/rust-gallery"
arch=('x86_64')
license=('GPL')
depends=('')
makedepends=('git' 'cargo' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/TheNeikos/rust-gallery.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}/"
    mkdir -p "$pkgdir/usr/bin"
	install "target/release/gallery" "$pkgdir/usr/bin/rust-gallery"
}
