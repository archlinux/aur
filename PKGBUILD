# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fineftp-server
pkgver=1.5.0
pkgrel=1
pkgdesc="FineFTP is a minimal FTP server library for Windows and Unix flavors"
arch=('any')
url="https://github.com/eclipse-ecal/fineftp-server"
license=('MIT')
depends=('asio')
makedepends=()
optdepends=()
source=(https://github.com/eclipse-ecal/fineftp-server/archive/v$pkgver.tar.gz
        Findasio.cmake.patch)
md5sums=('ac03b3921b65b34be8cfa7176cf5acd4'
         '4073a681f63f2b346acefebe026f506f')

prepare() {
    patch --forward --strip=1 --input="../Findasio.cmake.patch" "$pkgname-$pkgver/thirdparty/asio-module/Findasio.cmake"
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
