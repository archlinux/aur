# Maintainer: Clément Dommerc <clement.dommerc@gmail.com>
pkgname='qlstatus'
pkgver=1.1.8
pkgrel=1
pkgdesc='Light and modular status bar for tiling window managers'
arch=('x86_64')
url='https://github.com/qlem/qlstatus'
license=('MIT')
depends=('glibc' 'libpulse' 'libnl' 'libnotify')
makedepends=('make' 'cmake' 'pkgconf' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qlem/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e93e04c4a2404ad537ed7a043e58248d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cmake -B build/ .
    cmake --build build/
    ./manual.sh > qlstatus.1
}

package() {
    mkdir -p "$pkgdir/etc"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man1"
    cd "$srcdir/$pkgname-$pkgver"
    install -v ./build/qlstatus "$pkgdir/usr/bin"
    install -v --mode=644 qlstatus.conf "$pkgdir/etc"
    install -v --mode=644 qlstatus.1 "$pkgdir/usr/share/man/man1"
}
