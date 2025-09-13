# Maintainer: Felix Kauselmann <licorn@gmail.com>
# Contributor: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient
pkgver=2.14.0
pkgrel=1
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('x86_64' 'armv7h')
license=('MIT')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'libmaxminddb' 'leveldb' 'openssl' 'geoip' 'leveldb' 'websocketpp>=0.8.2-3' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm' 'ninja' 'nlohmann-json' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/airdcpp-web/airdcpp-webclient/archive/${pkgver}.tar.gz") 
sha256sums=('ca1f0d134968e5b4272efd6125fb51747aa8d35ca4ea20536e4a02aa95e79d5e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake ./ -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
    ninja
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja install
}
