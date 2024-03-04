# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fineftp-server
pkgver=1.4.2
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
md5sums=('632542cf3c7973a8a35681ea9bf0f970'
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
