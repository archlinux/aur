# Maintainer: Felix Kauselmann <licorn@gmail.com>
# Contributor: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient
pkgver=2.13.3
pkgrel=2
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('x86_64' 'armv7h')
license=('MIT')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'libmaxminddb' 'leveldb' 'openssl' 'geoip' 'leveldb' 'websocketpp>=0.8.2-3' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm' 'ninja' 'nlohmann-json' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/airdcpp-web/airdcpp-webclient/archive/${pkgver}.tar.gz") 
sha256sums=('07be52b4f31147cc8651e8621f3dc925895f9f42cef47d9497d67f822c8c8e69')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake ./ -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
    ninja
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja install
}
