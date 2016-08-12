# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=lzma_alone
pkgver=16.02
pkgrel=1
pkgdesc="An algorithm used to perform lossless data compression"
arch=('i686' 'x86_64')
url="http://www.7-zip.org/sdk.html"
license=('custom')
depends=('gcc-libs')
source=("http://www.7-zip.org/a/lzma$(echo ${pkgver} | tr -d '.').7z")
noextract=("lzma$(echo ${pkgver} | tr -d '.').7z")
sha256sums=('98e6c9b2f6ce07bc14fecc96a230f197b2c1f9b85b8598bcd5cc471be0b46037')

prepare(){
	mkdir -p lzma-sdk-"$pkgver"
	
	cd lzma-sdk-"$pkgver"
	
	bsdtar -x -f ../lzma$(echo ${pkgver} | tr -d '.').7z
}

build() {
	cd lzma-sdk-"$pkgver"/CPP/7zip/Bundles/LzmaCon
	
	make -f makefile.gcc
}

package() {
	cd lzma-sdk-"$pkgver"/CPP/7zip/Bundles/LzmaCon
	
	install -D -m755 lzma "${pkgdir}/usr/bin/lzma_alone"
	
	
	# Create a LICENSE file
	
	cd "$srcdir"/lzma-sdk-"$pkgver"/DOC
	
	sed -n '27,41p' lzma-sdk.txt > LICENSE
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
