# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=2.0.6
pkgrel=1
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz")
sha256sums=('ab93b361b9a48db828da1527152a98b9e3b5bf716f6b9f9ec24cd0e57b113399')
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
