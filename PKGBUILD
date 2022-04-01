# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch-git
pkgver=1.7.r111.g82bdbe4
pkgrel=2
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/${pkgname/-git/}"
license=('GPL3')
makedepends=('gcc')
optdepends=("viu: Display distro logos as images"
			"lshw: Better GPU detection")
conflicts=('uwufetch')
source=("$pkgname"::'git+https://github.com/TheDarkBug/uwufetch.git')
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	sed -i "45s/build//" Makefile
	sed -i "46s/\$(ETC_DIR)/\$(DESTDIR)\/..\$(ETC_DIR)/" Makefile
	sed -i "49s/\$(ETC_DIR)/\$(DESTDIR)\/..\$(ETC_DIR)/" Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/usr" install
}
