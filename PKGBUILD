# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fineftp-server
pkgver=1.3.1
pkgrel=2
pkgdesc="FineFTP is a minimal FTP server library for Windows and Unix flavors"
arch=('any')
url="https://github.com/continental/fineftp-server"
license=('MIT')
depends=('asio')
makedepends=()
optdepends=()
source=(https://github.com/continental/fineftp-server/archive/v$pkgver.tar.gz
        Findasio.cmake.patch)
md5sums=('51773b4283be0b0dc7feaa7cd94e040f'
         '4073a681f63f2b346acefebe026f506f')

prepare() {
    patch --forward --strip=1 --input="../Findasio.cmake.patch" "$pkgname-$pkgver/cmake/Findasio.cmake"
}

build() {
    cd $pkgname-$pkgver
    mkdir -p _build
    cd _build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make

}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd _build
    DESTDIR="$pkgdir" make install
}
