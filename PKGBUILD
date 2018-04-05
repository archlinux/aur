# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=annie
pkgver=0.6.4
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=("MIT")
makedepends=("go")
depends=("ffmpeg")
conflicts=("annie")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iawia002/annie/archive/${pkgver}.tar.gz")
sha256sums=('e7f9caf29bf4b48e9329f0c7efba7988bcd2f8d0361b710022a40cd033164d4f')

prepare(){
	mkdir -p "$srcdir/src/github.com/iawia002/annie"
	cp -r "$srcdir/$pkgname-$pkgver/"{downloader,config,extractors,parser,request,static,utils,vendor} \
		"$srcdir/src/github.com/iawia002/annie"
}


build(){
	cd "${pkgname}-${pkgver}"
	GOPATH="$srcdir" go build
}

package(){
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

