# Maintainer: Tr1NgleDev <me@tr1ngle.dev>
pkgname=img2ndtf
pkgver=1.1
pkgrel=1
pkgdesc="Converts an image (jpeg/png/tga/bmp/psd/pic) to an NDTF (N-Dimensional Texture Format) file."
arch=('x86_64')
url="https://github.com/Tr1NgleDev/$pkgname"
license=('Apache-2.0 license')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('4a3b0295f41814885bbec991326ef1909baed4a2084af745e4a40d1cc1f9bf95')

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
