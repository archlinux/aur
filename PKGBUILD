# Maintainer: Lawrence Thorpe <lawrence at lawrencethorpe.uk>
pkgname=dng
pkgver=13.4
pkgrel=2
pkgdesc="Wrapper around Adobe DNG Converter via wine to provide POSIX command line parsing"
arch=('x86_64')
url="https://github.com/thorpelawrence/dng"
license=('ZLIB')
depends=(wine)
makedepends=(git innoextract)
source=("$pkgname-$pkgver::git+$url.git"
        'https://download.adobe.com/pub/adobe/dng/win/AdobeDNGConverter_x64_13_4.exe')
sha512sums=('SKIP'
            '524abefab5eda38f7665723214aa82f2e8db9d9fc6923cbebb6e302ace86c51edd95c3cc240874a3d76f83c966731f9d691678342b9e2a158d9e1a71b1f341cd')

build() {
    cd "$pkgname-$pkgver"
    make prefix="/usr" SKIPCHECKSUM="true" installer_exe="$srcdir/AdobeDNGConverter_x64_13_4.exe"
}

package() {
    cd "$pkgname-$pkgver"
    make prefix="/usr" DESTDIR="$pkgdir" install
}
