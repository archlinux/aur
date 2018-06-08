# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>

pkgname=pngquant
pkgver=2.12.1
pkgrel=2
pkgdesc="command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib' 'lcms2')
source=("https://github.com/kornelski/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/ImageOptim/libimagequant/archive/$pkgver/libimagequant-$pkgver.tar.gz")
sha256sums=('352ff60420fd5ab7a94f548be6f87dbdfa15eb28e3cc8f61c089f4e0be7ee1a0'
            '7035eb281bc9a49cf36db8db807b713d03a0ffe8c5abfbb17a9ea8a038f21d5e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    rm -rf lib
    ln -s ../libimagequant-$pkgver lib
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --with-openmp
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
