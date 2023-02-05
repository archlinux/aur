# Maintainer: Lawrence Thorpe <lawrence at lawrencethorpe.uk>
pkgname=dng
pkgver=15.1.1
pkgrel=1
pkgdesc="Wrapper around Adobe DNG Converter via wine to provide POSIX command line parsing"
arch=('x86_64')
url="https://github.com/thorpelawrence/dng"
license=('ZLIB')
depends=(wine)
makedepends=(git innoextract rust)
source=("$pkgname-$pkgver::git+$url.git"
        'https://download.adobe.com/pub/adobe/dng/win/AdobeDNGConverter_x64_15_1_1.exe')
sha512sums=('SKIP'
            '03e88bc8a81b0a46857e316ad21f515c9ffc68cbe651ba3ca93bf4babc105372705e8d0a94f4099e762437f54f0275618bfdce89570197bc06bb6f56f12ef46e')

build() {
    cd "$pkgname-$pkgver"
    make prefix="/usr" SKIPCHECKSUM="true" installer_exe="$srcdir/AdobeDNGConverter_x64_15_1_1.exe"
}

package() {
    cd "$pkgname-$pkgver"
    make prefix="/usr" SKIPCHECKSUM="true" DESTDIR="$pkgdir" install
}
