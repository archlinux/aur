# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=wayoled-git
pkgver=0.1.0.r1.g0ad43b0
pkgrel=1
pkgdesc="OLED care daemon for wlroots Wayland compositors."
arch=('x86_64')
url="https://github.com/Youwes09/WayOLED"
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
license=('MIT')
depends=('wayland' 'glibc')
makedepends=('meson' 'git')
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir"
	arch-meson build ${pkgname}
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname}"
	meson install -C "$srcdir/build" --destdir "${pkgdir}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
