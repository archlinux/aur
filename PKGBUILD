# Maintainer: Alexey Mukovnin <alexey.1983@gmail.com>
pkgname=psfiles
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI tool to monitor file system activity of a Linux process"
url='https://github.com/mukovnin/psfiles'
source=("https://github.com/mukovnin/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a787c545bcb592559a7674a3db8eec78190f36c3a98e542d01a87cb26f6fa05a')
arch=('x86_64' 'aarch64')
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
