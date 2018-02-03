# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=lzma_alone
pkgver=18.01
_srcver="$(printf '%s' "$pkgver" | tr -d '.')"
pkgrel=1
pkgdesc='An algorithm used to perform lossless data compression'
arch=('i686' 'x86_64')
url='http://www.7-zip.org/sdk.html'
license=('custom')
depends=('gcc-libs')
source=("http://www.7-zip.org/a/lzma${_srcver}.7z")
noextract=("lzma${_srcver}.7z")
sha256sums=('630f2534f73633011d60c6724cd8c1b3e549edd844dc09f54aae358d64089802')

prepare(){
    mkdir -p lzma-sdk-"$pkgver"
    
    cd lzma-sdk-"$pkgver"
    
    bsdtar -x -f ../"lzma${_srcver}.7z"
}

build() {
    cd lzma-sdk-"$pkgver"/CPP/7zip/Bundles/LzmaCon
    
    make -f makefile.gcc
}

package() {
    cd lzma-sdk-"$pkgver"/CPP/7zip/Bundles/LzmaCon
    
    install -D -m755 lzma "${pkgdir}/usr/bin/lzma_alone"
    
    # create a LICENSE file
    cd "${srcdir}/lzma-sdk-${pkgver}/DOC"
    sed -n '27,41p' lzma-sdk.txt > LICENSE
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
