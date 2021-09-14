# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>

pkgname=wldash-git
pkgver=r165.5e5e8876f6dbecaf5080
pkgrel=1
pkgdesc="Wayland launcher/dashboard"
arch=('x86_64')
url="https://github.com/kennylevinsen/wldash"
license=('GPL3')
depends=(libpulse alsa-lib fontconfig)
makedepends=('git' 'rust') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=("git+$url")
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
	cd "$srcdir/${pkgname%-git}"
	mkdir -p $pkgdir/usr/bin
	cp target/release/wldash $pkgdir/usr/bin/wldash
}
