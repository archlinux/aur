# Maintainer: Flat <flat@imo.uto.moe>
pkgname=imgbrd-grabber-git
pkgver=v4.6.0.r3.d9dc611
pkgrel=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('i686' 'x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache')
groups=()
depends=('qscintilla-qt5' 'qt5-multimedia' 'qt5-script')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Bionus/imgbrd-grabber.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake PREFIX=/usr Grabber.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install
}
