# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=yoctofetch-git
pkgver=2.0.0.r4.be15fe1
pkgrel=2
pkgdesc="Fast and low footprint system fetch tool for the Linux UAPI"
arch=('aarch64' 'x86_64')
url="https://codeberg.org/Phosphenius/yoctofetch"
license=('CC0-1.0' 'GFDL-1.3-or-later' 'GPL-3.0-or-later')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

