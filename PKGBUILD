# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch-git
pkgver=1.2.r20.geb2471b
pkgrel=1
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
	install -D "${pkgname/-git/}" "$pkgdir/usr/bin/${pkgname/-git/}"
	install -d "$pkgdir/usr/lib/uwufetch"
	install res/* "$pkgdir/usr/lib/uwufetch"
	install -D "${pkgname/-git/}.1.gz" "$pkgdir/usr/share/man/man1/${pkgname/-git}.1.gz"
}
