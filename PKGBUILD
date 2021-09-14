# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>

pkgname=wldash-git
pkgver=0.2+67.g5e5e8876f6
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
	git describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
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
