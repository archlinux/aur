# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=spades
_name=SPAdes
pkgver=3.15.2
pkgrel=1
pkgdesc="SPAdes – St. Petersburg genome assembler – is an assembly toolkit containing various assembly pipelines."
arch=('x86_64')
url="http://cab.spbu.ru/software/spades/"
license=('unknown')
makedepends=('gcc' 'cmake' 'zlib' 'bzip2' 'sh')
provides=("spades")
conflicts=("spades-bin" "spades-git")
source=("http://cab.spbu.ru/files/release$pkgver/$_name-$pkgver.tar.gz"
    'spades')
b2sums=('0430ce78fa622b6a36eebd4eded9207df2135891009b082a6c243b7f499ce12cb13cb5b56b3b82183c1d7bbe77d56b60d1be543633a1ba03da8572e5f3812099'
    'e5131758892e8dea5cb22c6e7fa519aee4c1efd79c0c71b257e25e455aca27554bf4a5cd422bcc7e251e3ac6c3d7544693ad99bcbc3fa9054c622e00b99d9953')

prepare() {
    cd $srcdir/$_name-$pkgver/
    mkdir -p bin
}

build() {
    cd $srcdir/$_name-$pkgver/
    ./spades_compile.sh
}

check() {
    cd $srcdir/$_name-$pkgver/bin/
    python spades.py --test
}

package() {
    cd $srcdir/$_name-$pkgver/
    install -Dm755 $srcdir/$pkgname "${pkgdir}/usr/bin/$pkgname"

    # install -Dm755 bin "${pkgdir}/usr/share/$pkgname/bin"
    mkdir -p $pkgdir/usr/share/$pkgname/
    cp -R bin $pkgdir/usr/share/$pkgname/
    chmod -R 755 $pkgdir/usr/share/$pkgname/bin

    cp -R share $pkgdir/usr/share/$pkgname/
    chmod -R 755 $pkgdir/usr/share/$pkgname/share

}
