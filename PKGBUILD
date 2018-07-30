# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=2.0.4
pkgrel=1
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz")
sha256sums=('1c521005138f3eb72ec0528a8ab07ee46b8ab0cf76342d8ff27c1c9fdcf5261c')
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
