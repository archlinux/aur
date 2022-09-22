# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch-git
pkgver=2.0.r3.g85643f5
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/${pkgname/-git/}"
license=('GPL3')
makedepends=('gcc')
optdepends=("viu: Display distro logos as images"
			"lshw: Better GPU detection")
conflicts=('uwufetch')
source=("$pkgname"::'git+https://github.com/TheDarkBug/uwufetch.git')
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i "52s/build//" Makefile
	sed -i "53s/\$(ETC_DIR)/\$(DESTDIR)\/..\$(ETC_DIR)/" Makefile
	sed -i "56s/\$(ETC_DIR)/\$(DESTDIR)\/..\$(ETC_DIR)/" Makefile
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
