# Maintainer: Tr1NgleDev <me@tr1ngle.dev>
pkgname=ndtf2img
pkgver=1.0
pkgrel=1
pkgdesc="Converts an NDTF (N-Dimensional Texture Format) to an image (jpeg/png/tga/bmp)."
arch=('x86_64')
url="https://github.com/Tr1NgleDev/$pkgname"
license=('Apache-2.0 license')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('8c56b1a9bede514b0c36e0863adccc5b4bfe16415c885a0f209ca6da47572fbe')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	if [ ! -d libs/ndtf/.git ]
	then
		git clone --depth=1 --recursive "https://github.com/Tr1NgleDev/ndtf.git" libs/ndtf
	else
		cd libs/ndtf
		git pull
		cd ../../
	fi
	cmake -B build
	cd build
	make
}

package() {
	install -Dm755 $srcdir/$pkgname-$pkgver/build/$pkgname $pkgdir/usr/bin/$pkgname
}
