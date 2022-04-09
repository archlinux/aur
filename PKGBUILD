# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: BinHarby <lance.alameri@gmail.com>
pkgname=yt-len
pkgver=0.1.r
pkgrel=1
pkgdesc="Python program ,, get video/playlist length and titles"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/binHarby/yt-len"
license=('MIT')
depends=('python-pytube')
makedepends=(git)
provides=(yt-len)
source=(git+$url)
md5sums=('SKIP')
pkgver() {
	cd ${_pkgname}
	printf "0.1.r%s%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	if [ -e "$srcdir/$pkgname-$pkgver" ]
	then
		rm -r "$srcdir/$pkgname-$pkgver"
	fi
	mkdir "$srcdir/$pkgname-$pkgver" 
	mv "$srcdir/yt-len/yt-len" "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p usr/bin
	chmod +x yt-len
	mv yt-len usr/bin/yt-len
}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	mv usr "$pkgdir/"
}
