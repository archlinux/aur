# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=gd-tools-git
pkgver=1.4.r0.gd788848
pkgrel=1
pkgdesc="A set of helpful programs to enhance goldendict for immersion learning."
arch=("x86_64")
url="https://github.com/Ajatt-Tools/gd-tools"
license=("GPL3")
makedepends=("git" "p7zip" "xmake" "gcc" "nlohmann-json" "marisa" "fmt")
provides=("gd-tools")
conflicts=("gd-tools")
source=("$pkgname::git+https://github.com/Ajatt-Tools/gd-tools.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd -- "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd -- "$srcdir/$pkgname"
	xmake config --mode=release
	xmake build -vwy "${pkgname%-*}"
}

package() {
	cd -- "$srcdir/$pkgname"
	xmake install --root -v --installdir="${pkgdir}/usr" "${pkgname%-*}"
}
