# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch-git
pkgver=1.4.r0.09b32b1
pkgrel=2
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/${pkgname/-git/}"
license=('GPL3')
makedepends=('gcc' 'pandoc')
optdepends=("viu: Display distro logos as images"
			"lshw: Better GPU detection")
conflicts=('uwufetch')
source=("$pkgname"::'git+https://github.com/TheDarkBug/uwufetch.git')
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	export DESTDIR="$pkgdir"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/share/man/man1/
	make install
}
