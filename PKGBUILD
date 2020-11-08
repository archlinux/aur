# Maintainer: Clément Dommerc <clement.dommerc@gmail.com>
pkgname='qlstatus'
pkgver=1.0.6
pkgrel=7
pkgdesc='Light and modular status bar for tiling window managers'
arch=('x86_64')
url='https://github.com/qlem/qlstatus'
license=('MIT')
depends=('glibc' 'libpulse' 'libnl' 'libnotify')
makedepends=('make' 'cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qlem/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('4a75856087f65846dd7f7588af48ae07')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cmake -B build/ .
    cmake --build build/
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc"
    cd "$srcdir/$pkgname-$pkgver"
    install -v ./build/qlstatus "$pkgdir/usr/bin"
    install -v --mode=644 qlstatus.conf "$pkgdir/etc"
}
