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
md5sums=('76d4cb85e1ed935fba00ba5a25611ce1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cmake -B build/ .
    cmake --build build/
    ./manual.sh > qlstatus.1
}

package() {
    mkdir -p "$pkgdir/etc"
    mkdir -p "$pkgdir/usr/local/bin"
    mkdir -p "$pkgdir/usr/local/share/man/man1"
    cd "$srcdir/$pkgname-$pkgver"
    install -v --mode=644 qlstatus.conf "$pkgdir/etc"
    install -v ./build/qlstatus "$pkgdir/usr/local/bin"
    install -v --mode=644 qlstatus.1 "$pkgdir/usr/local/share/man/man1"
}
