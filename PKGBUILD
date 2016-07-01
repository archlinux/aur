# Maintainer: Max Zhao <alcasa.mz@gmail.com>
pkgname=hiptext
pkgver=0.1
pkgrel=1
pkgdesc="hiptext is command line tool for rendering images and videos inside terminals."
arch=('any')
url="https://github.com/jart/hiptext"
license=('GPL')
groups=()
depends=()
makedepends=(
"libpng12"
"libjpeg-turbo"
"freetype2"
"giflib"
"ragel"
"ffmpeg"
"gflags"
"google-glog"
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jart/hiptext/archive/0.1.tar.gz"
        "ffmpeg.patch"
	"hiptext.sh")
noextract=()
md5sums=('a028fb0b95a8745e81258614c92064e1'
         '0a6b5cb5275f71f29027f1f5cc1c4b50'
         '29c7c80e4c783406948a51034d15076c')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "../ffmpeg.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/$pkgname/bin"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr/share/$pkgname" install
	cp "$srcdir/hiptext.sh" "$pkgdir/usr/bin/hiptext"
	cp "$srcdir/$pkgname-$pkgver/DejaVuSansMono.ttf" "$pkgdir/usr/share/$pkgname/dejavu.ttf"
}
