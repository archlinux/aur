# Maintainer: Tr1NgleDev <me@tr1ngle.dev>
pkgname=img2ndtf
pkgver=1.0
pkgrel=1
pkgdesc="Converts an image (jpeg/png/tga/bmp/psd/pic) to an NDTF (N-Dimensional Texture Format)."
arch=('x86_64')
url="https://github.com/Tr1NgleDev/$pkgname"
license=('Apache-2.0 license')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('08283e114008fae705088152613ab3605ac917ef2f9bba68f89a2ec89b35a2cf')

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
