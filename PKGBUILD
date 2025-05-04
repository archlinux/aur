# Maintainer: Tr1NgleDev <me@tr1ngle.dev>
pkgname=ndtf-info
pkgver=1.0
pkgrel=1
pkgdesc="Outputs info from the header of a given NDTF (N-Dimensional Texture Format) file."
arch=('x86_64')
url="https://github.com/Tr1NgleDev/$pkgname"
license=('Apache-2.0 license')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('60ceb35ca27a9ce4d5975ee9d985bf92a6ee6c23b98509bb1d7d1d8c9f4d6f90')

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
