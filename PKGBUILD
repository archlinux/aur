# Maintainer: Alexander Kuntsch <alex.kuntsch plus aur at mailbox dot org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=rrcc
pkgver=0.8.7
pkgrel=1
pkgdesc="RoboRock Control Center for Xiaomi vacuum cleaners"
arch=('x86_64')
url="https://github.com/LazyT/rrcc"
license=('GPL3')
depends=('libssh'
         'libarchive'
         'qt5-websockets')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/LazyT/rrcc/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('ed2cf9274acb08646d3b34877551aa42'
         '35473fc49be43e11dab4fa8b1760dab8')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Don't pass source directory to linker as relative path
    sed -i '/QMAKE_LFLAGS.*rpath/d' "$pkgname.pro"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    qmake
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 rrcc "$pkgdir/usr/bin/rrcc"
    install -Dm644 res/ico/app.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
