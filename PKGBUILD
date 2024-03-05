# Maintainer: Alexey Mukovnin <alexey.1983@gmail.com>
pkgname=psfiles
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI tool to monitor file system activity of a Linux process"
url='https://github.com/mukovnin/psfiles'
source=("https://github.com/mukovnin/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8dd87c16383e4cd6c5f1cff70e5254be836cfda57471668ee5dcdb39fdce358d')
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
