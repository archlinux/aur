# Maintainer: Alexey Mukovnin <alexey.1983@gmail.com>
pkgname=psfiles
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI tool to monitor file system activity of a Linux process"
url='https://github.com/mukovnin/psfiles'
source=("https://github.com/mukovnin/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d447ffef5a1f8760ff1baf320fad3e93a2abb5975b14d2ad071dc60ca2e3d111')
arch=('x86_64' 'aarch64')
license=('MIT')
options=('zipman')
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
    install -D -m644 psfiles.1 -t "$pkgdir/usr/share/man/man1"
}
