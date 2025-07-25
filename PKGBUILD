# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=pinfo-meson-git
pkgver=0.6.13.r56.g2de5999
pkgrel=1
pkgdesc="A hypertext info file viewer"
arch=('x86_64')
url="https://github.com/nicolarevelant/pinfo"
license=('GPL-2.0-only')
makedepends=('git' 'meson')
depends=('ncurses' 'readline')
conflicts=('pinfo')
source=("$pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	arch-meson build
	meson compile -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" meson install -C build
}
