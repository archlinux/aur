# Maintainer: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>
pkgname=wldash-git
pkgver=r75.2bb0a2f
pkgrel=1
pkgdesc="Wayland launcher/dashboard"
arch=('x86_64')
url="https://github.com/kennylevinsen/wldash"
license=('GPL3')
depends=()
makedepends=('git' 'rust') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=('git+https://github.com/kennylevinsen/wldash.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release --features=bc
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p $pkgdir/usr/bin
	cp target/release/wldash $pkgdir/usr/bin/wldash
}
