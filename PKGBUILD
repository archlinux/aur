# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=2.2.1
pkgrel=2
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz")
sha256sums=('c73fe4ea4556ca5ebbd962ed3a39d191fd220baf40a9eddb39e9ad93706ab096')
depends=('qt5-base')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir build cli-build
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    qmake PREFIX="/usr" DEFINES+="DWR_RELEASE" ../dwrandomizer.pro
    make
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    qmake PREFIX="/usr" DEFINES+="DWR_RELEASE" ../dwrandomizer-cli.pro
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    install -D -t $pkgdir/usr/bin/ dwrandomizer
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    install -t $pkgdir/usr/bin/ dwrandomizer-cli
    install -D -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$pkgver/LICENSE"
    install -D -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname-$pkgver/resources/dwrandomizer.desktop"

    #install the icons
    install -D -T "$srcdir/$pkgname-$pkgver/resources/icons/dwrandomizer_512x512.png" "$pkgdir/usr/share/icons/512x512/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/resources/icons/dwrandomizer_256x256.png" "$pkgdir/usr/share/icons/256x256/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/resources/icons/dwrandomizer_128x128.png" "$pkgdir/usr/share/icons/128x128/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/resources/icons/dwrandomizer_64x64.png" "$pkgdir/usr/share/icons/64x64/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/resources/icons/dwrandomizer_32x32.png" "$pkgdir/usr/share/icons/32x32/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/resources/icons/dwrandomizer_16x16.png" "$pkgdir/usr/share/icons/16x16/dwrandomizer.png"
}
