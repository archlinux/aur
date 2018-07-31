# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=2.0.5
pkgrel=1
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz")
sha256sums=('f8dc746c01319f1be713168e7f0d6dfe0acf14d307ed54266c6762c2c6c0a181')
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
    mkdir -p $pkgdir/usr/bin
    cd "$srcdir/$pkgname-$pkgver/build"
    cp dwrandomizer $pkgdir/usr/bin/
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    cp dwrandomizer-cli $pkgdir/usr/bin/
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
