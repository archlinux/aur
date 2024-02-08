# Maintainer: Alexey Mukovnin <alexey.1983@gmail.com>
pkgname=psfiles
pkgver=0.1.0
pkgrel=2
pkgdesc="A CLI tool to monitor file system activity of a Linux process"
url='https://github.com/mukovnin/psfiles'
source=("https://github.com/mukovnin/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0302cd086f14c3bf06a6794e3730a4741a2531c2249cba6fc29afbceb9ea36bf')
arch=('x86_64')
license=('MIT')
makedepends=('cmake')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    cd "$pkgname-$pkgver"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
